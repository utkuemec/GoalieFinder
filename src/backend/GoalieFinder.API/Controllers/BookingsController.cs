using System.Security.Claims;
using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Domain.Entities;
using GoalieFinder.Infrastructure.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Stripe;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class BookingsController : ControllerBase
{
    private readonly IApplicationDbContext _context;
    private readonly IConfiguration _configuration;
    private readonly IBookingEmailService _emailService;

    public BookingsController(IApplicationDbContext context, IConfiguration configuration, IBookingEmailService emailService)
    {
        _context = context;
        _configuration = configuration;
        _emailService = emailService;
        StripeConfiguration.ApiKey = _configuration["Stripe:SecretKey"];
    }

    [HttpPost]
    public async Task<IActionResult> CreateBooking([FromBody] CreateBookingRequest request)
    {
        var gkProfile = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .FirstOrDefaultAsync(g => g.Id == request.GoalkeeperProfileId);

        if (gkProfile == null)
            return NotFound(new { error = "Goalkeeper not found" });

        if (!gkProfile.IsAvailable)
            return BadRequest(new { error = "Goalkeeper is not available" });

        var amount = gkProfile.PricePerMatch;
        var platformFee = amount * 0.10m;
        var subtotal = amount + platformFee;
        var taxRate = GetProvincialTaxRate(request.ProvinceCode ?? "ON");
        var taxAmount = Math.Round(subtotal * taxRate, 2);
        var subtotalWithTax = subtotal + taxAmount;
        // Stripe Canada: 2.9% + $0.30 — solve for fee so net covers all costs
        var stripeFee = Math.Round((subtotalWithTax * 0.029m + 0.30m) / (1 - 0.029m), 2);
        var totalAmount = subtotalWithTax + stripeFee;

        var piService = new PaymentIntentService();
        var piOptions = new PaymentIntentCreateOptions
        {
            Amount = (long)(totalAmount * 100),
            Currency = "cad",
            CaptureMethod = "manual",
            Metadata = new Dictionary<string, string>
            {
                { "goalkeeper_id", gkProfile.Id.ToString() },
                { "goalkeeper_name", $"{gkProfile.User.FirstName} {gkProfile.User.LastName}" },
                { "captain_name", request.CaptainName },
                { "field_name", request.FieldName },
            },
            AutomaticPaymentMethods = new PaymentIntentAutomaticPaymentMethodsOptions { Enabled = true },
        };

        PaymentIntent paymentIntent;
        try
        {
            paymentIntent = await piService.CreateAsync(piOptions);
        }
        catch (StripeException ex)
        {
            return BadRequest(new { error = $"Payment failed: {ex.Message}" });
        }

        var match = new Match
        {
            FieldName = request.FieldName,
            FieldAddress = request.FieldAddress,
            FieldLatitude = request.FieldLatitude,
            FieldLongitude = request.FieldLongitude,
            MatchDateTime = request.MatchDateTime,
            DurationMinutes = request.DurationMinutes,
            PaymentAmount = amount,
            PlatformFee = platformFee,
            TaxRate = taxRate,
            TaxAmount = taxAmount,
            StripeFee = stripeFee,
            TotalAmount = totalAmount,
            Notes = $"Booked by {request.CaptainName} ({request.CaptainPhone}). {request.Notes ?? ""}".Trim(),
            Status = MatchStatus.Open,
            AcceptedGoalkeeperId = gkProfile.Id,
            TeamProfileId = await GetOrCreateGuestTeamProfileId(request.CaptainName, request.CaptainEmail, request.CaptainPhone),
        };

        _context.Matches.Add(match);

        var payment = new Payment
        {
            MatchId = match.Id,
            StripePaymentIntentId = paymentIntent.Id,
            Amount = totalAmount,
            PlatformFee = platformFee,
            TaxAmount = taxAmount,
            StripeFee = stripeFee,
            GoalkeeperPayout = amount,
            Status = PaymentStatus.Pending,
        };

        _context.Payments.Add(payment);
        await _context.SaveChangesAsync();

        return Ok(new
        {
            bookingId = match.Id,
            clientSecret = paymentIntent.ClientSecret,
            amount = totalAmount,
            goalkeeperName = $"{gkProfile.User.FirstName} {gkProfile.User.LastName}",
            goalkeeperPrice = amount,
            platformFee,
            taxAmount,
            stripeFee,
        });
    }

    /// Called by frontend AFTER Stripe payment succeeds — sends email to goalkeeper
    [HttpPost("{id}/payment-complete")]
    public async Task<IActionResult> PaymentComplete(Guid id)
    {
        var match = await _context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .FirstOrDefaultAsync(m => m.Id == id);
        if (match == null) return NotFound(new { error = "Booking not found" });

        var gkProfile = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .FirstOrDefaultAsync(g => g.Id == match.AcceptedGoalkeeperId);
        if (gkProfile == null) return NotFound(new { error = "Goalkeeper not found" });

        var payment = await _context.Payments.FirstOrDefaultAsync(p => p.MatchId == id);
        if (payment == null) return NotFound(new { error = "Payment not found" });

        if (payment.Status != PaymentStatus.Pending)
            return Ok(new { message = "Already processed" });

        // Verify with Stripe that the payment was actually authorized
        var piService = new PaymentIntentService();
        var pi = await piService.GetAsync(payment.StripePaymentIntentId);
        if (pi.Status != "requires_capture" && pi.Status != "succeeded")
            return BadRequest(new { error = "Payment has not been completed. Please enter your card details and pay first." });

        payment.Status = PaymentStatus.Authorized;
        await _context.SaveChangesAsync();

        // Payment verified — now send notification and email
        _context.Notifications.Add(new Notification
        {
            UserId = gkProfile.UserId,
            Title = "New Booking Request!",
            Message = $"{match.TeamProfile.User.FirstName} wants to book you for {match.FieldName} on {match.MatchDateTime:MMM dd 'at' HH:mm}",
            Type = NotificationType.MatchRequest,
            Data = System.Text.Json.JsonSerializer.Serialize(new { matchId = match.Id }),
        });
        await _context.SaveChangesAsync();

        _ = _emailService.SendBookingRequestEmail(
            goalkeeperEmail: gkProfile.User.Email,
            goalkeeperName: $"{gkProfile.User.FirstName} {gkProfile.User.LastName}",
            captainName: $"{match.TeamProfile.User.FirstName} {match.TeamProfile.User.LastName}",
            captainPhone: match.TeamProfile.User.PhoneNumber,
            fieldName: match.FieldName,
            fieldAddress: match.FieldAddress,
            matchDateTime: match.MatchDateTime,
            durationMinutes: match.DurationMinutes,
            goalkeeperFee: match.PaymentAmount,
            serviceFee: match.PlatformFee,
            totalAmount: match.TotalAmount,
            notes: match.Notes);

        return Ok(new { message = "Payment confirmed, goalkeeper notified" });
    }

    [HttpPut("{id}/accept")]
    [Microsoft.AspNetCore.Authorization.Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> AcceptBooking(Guid id)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var gkProfile = await _context.GoalkeeperProfiles.FirstOrDefaultAsync(g => g.UserId == userId);
        if (gkProfile == null) return NotFound(new { error = "Profile not found" });

        var match = await _context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .FirstOrDefaultAsync(m => m.Id == id && m.AcceptedGoalkeeperId == gkProfile.Id);
        if (match == null) return NotFound(new { error = "Booking not found" });
        if (match.Status != MatchStatus.Open) return BadRequest(new { error = "Booking is no longer pending" });

        var payment = await _context.Payments.FirstOrDefaultAsync(p => p.MatchId == id);
        if (payment == null) return BadRequest(new { error = "Payment not found" });

        // Capture payment (charge card) — money held by PLATFORM, not sent to goalkeeper yet
        try
        {
            var piService = new PaymentIntentService();
            var capturedPi = await piService.CaptureAsync(payment.StripePaymentIntentId);
            payment.Status = PaymentStatus.Captured;
            payment.StripeChargeId = capturedPi.LatestChargeId;
        }
        catch (StripeException ex)
        {
            return BadRequest(new { error = $"Payment capture failed: {ex.Message}" });
        }

        match.Status = MatchStatus.Accepted;
        match.UpdatedAt = DateTime.UtcNow;

        // Generate a unique token so captain can confirm match without logging in
        var confirmToken = Guid.NewGuid().ToString("N");
        match.Notes = (match.Notes ?? "") + $"\n[CONFIRM_TOKEN:{confirmToken}]";

        await _context.SaveChangesAsync();

        var gkUser = await _context.Users.FindAsync(gkProfile.UserId);
        var baseUrl = _configuration["Frontend:BaseUrl"] ?? "https://www.goaliefinders.com";
        var confirmUrl = $"{baseUrl}/booking/{match.Id}/confirm?token={confirmToken}";
        var cancelUrl = $"{baseUrl}/booking/{match.Id}/cancel?token={confirmToken}";

        _ = _emailService.SendBookingAcceptedEmail(
            captainEmail: match.TeamProfile.User.Email,
            captainName: $"{match.TeamProfile.User.FirstName} {match.TeamProfile.User.LastName}",
            goalkeeperName: $"{gkUser?.FirstName} {gkUser?.LastName}",
            goalkeeperPhone: gkUser?.PhoneNumber ?? "",
            fieldName: match.FieldName,
            matchDateTime: match.MatchDateTime,
            totalCharged: match.TotalAmount,
            confirmUrl: confirmUrl,
            cancelUrl: cancelUrl);

        return Ok(new { message = "Booking accepted. Payment charged. Goalkeeper will be paid after the match is confirmed." });
    }

    /// Captain confirms the match happened — releases payment to goalkeeper
    [HttpPut("{id}/confirm")]
    public async Task<IActionResult> ConfirmMatch(Guid id, [FromQuery] string token)
    {
        var match = await _context.Matches
            .Include(m => m.Payment)
            .FirstOrDefaultAsync(m => m.Id == id);
        if (match == null) return NotFound(new { error = "Booking not found" });

        // Verify confirmation token
        if (string.IsNullOrEmpty(token) || !(match.Notes ?? "").Contains($"[CONFIRM_TOKEN:{token}]"))
            return BadRequest(new { error = "Invalid confirmation token" });

        if (match.Status != MatchStatus.Accepted)
            return BadRequest(new { error = "Match cannot be confirmed in its current state" });

        // Transfer money to goalkeeper
        var payment = await _context.Payments.FirstOrDefaultAsync(p => p.MatchId == id);
        var gkProfile = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .FirstOrDefaultAsync(g => g.Id == match.AcceptedGoalkeeperId);

        if (payment != null && gkProfile != null && !string.IsNullOrEmpty(gkProfile.User.StripeConnectAccountId))
        {
            try
            {
                var chargeId = payment.StripeChargeId;
                if (string.IsNullOrEmpty(chargeId))
                {
                    var piService = new PaymentIntentService();
                    var pi = await piService.GetAsync(payment.StripePaymentIntentId);
                    chargeId = pi.LatestChargeId;
                    payment.StripeChargeId = chargeId;
                }

                var transferOpts = new TransferCreateOptions
                {
                    Amount = (long)(match.PaymentAmount * 100),
                    Currency = "cad",
                    Destination = gkProfile.User.StripeConnectAccountId,
                    TransferGroup = payment.StripePaymentIntentId,
                    Description = $"Payout for match at {match.FieldName} on {match.MatchDateTime:MMM dd}",
                };
                if (!string.IsNullOrEmpty(chargeId))
                    transferOpts.SourceTransaction = chargeId;

                var transferService = new TransferService();
                var transfer = await transferService.CreateAsync(transferOpts);
                payment.StripeTransferId = transfer.Id;
                payment.Status = PaymentStatus.Released;
                payment.CompletedAt = DateTime.UtcNow;

                try
                {
                    await _emailService.SendPaymentReleasedEmail(
                        gkProfile.User.Email,
                        $"{gkProfile.User.FirstName} {gkProfile.User.LastName}",
                        match.FieldName,
                        match.MatchDateTime,
                        match.PaymentAmount);
                }
                catch { /* Non-critical */ }
            }
            catch (StripeException ex)
            {
                return BadRequest(new { error = $"Transfer failed: {ex.Message}" });
            }
        }

        match.Status = MatchStatus.Completed;
        match.UpdatedAt = DateTime.UtcNow;

        if (gkProfile != null)
        {
            gkProfile.TotalMatches++;
        }

        await _context.SaveChangesAsync();

        return Ok(new { message = "Match confirmed! Payment released to goalkeeper." });
    }

    /// Auto-confirm endpoint — called by a scheduled job or checked on dashboard load
    [HttpPost("auto-confirm")]
    public async Task<IActionResult> AutoConfirmExpiredMatches()
    {
        var cutoff = DateTime.UtcNow.AddHours(-24);

        var expiredMatches = await _context.Matches
            .Include(m => m.Payment)
            .Where(m => m.Status == MatchStatus.Accepted && m.MatchDateTime < cutoff)
            .ToListAsync();

        var confirmed = 0;
        foreach (var match in expiredMatches)
        {
            var payment = await _context.Payments.FirstOrDefaultAsync(p => p.MatchId == match.Id);
            var gkProfile = await _context.GoalkeeperProfiles
                .Include(g => g.User)
                .FirstOrDefaultAsync(g => g.Id == match.AcceptedGoalkeeperId);

            if (payment != null && gkProfile != null && !string.IsNullOrEmpty(gkProfile.User.StripeConnectAccountId))
            {
                try
                {
                    var chargeId = payment.StripeChargeId;
                    if (string.IsNullOrEmpty(chargeId))
                    {
                        var piService = new PaymentIntentService();
                        var pi = await piService.GetAsync(payment.StripePaymentIntentId);
                        chargeId = pi.LatestChargeId;
                        payment.StripeChargeId = chargeId;
                    }

                    var transferOpts = new TransferCreateOptions
                    {
                        Amount = (long)(match.PaymentAmount * 100),
                        Currency = "cad",
                        Destination = gkProfile.User.StripeConnectAccountId,
                        TransferGroup = payment.StripePaymentIntentId,
                        Description = $"Auto-payout for match at {match.FieldName}",
                    };
                    if (!string.IsNullOrEmpty(chargeId))
                        transferOpts.SourceTransaction = chargeId;

                    var transferService = new TransferService();
                    var transfer = await transferService.CreateAsync(transferOpts);
                    payment.StripeTransferId = transfer.Id;
                    payment.Status = PaymentStatus.Released;
                    payment.CompletedAt = DateTime.UtcNow;
                }
                catch { /* Log and continue */ }
            }

            match.Status = MatchStatus.Completed;
            match.UpdatedAt = DateTime.UtcNow;
            if (gkProfile != null) gkProfile.TotalMatches++;
            confirmed++;
        }

        await _context.SaveChangesAsync();
        return Ok(new { confirmed, message = $"{confirmed} matches auto-confirmed" });
    }

    [HttpPut("{id}/decline")]
    [Microsoft.AspNetCore.Authorization.Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> DeclineBooking(Guid id)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var gkProfile = await _context.GoalkeeperProfiles.FirstOrDefaultAsync(g => g.UserId == userId);
        if (gkProfile == null) return NotFound(new { error = "Profile not found" });

        var match = await _context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .FirstOrDefaultAsync(m => m.Id == id && m.AcceptedGoalkeeperId == gkProfile.Id);
        if (match == null) return NotFound(new { error = "Booking not found" });

        var payment = await _context.Payments.FirstOrDefaultAsync(p => p.MatchId == id);
        if (payment != null)
        {
            try
            {
                var piService = new PaymentIntentService();
                await piService.CancelAsync(payment.StripePaymentIntentId);
                payment.Status = PaymentStatus.Refunded;
            }
            catch { /* Payment may already be cancelled */ }
        }

        match.Status = MatchStatus.Cancelled;
        match.UpdatedAt = DateTime.UtcNow;

        await _context.SaveChangesAsync();

        var gkUser = await _context.Users.FindAsync(gkProfile.UserId);
        _ = _emailService.SendBookingDeclinedEmail(
            captainEmail: match.TeamProfile.User.Email,
            captainName: $"{match.TeamProfile.User.FirstName} {match.TeamProfile.User.LastName}",
            goalkeeperName: $"{gkUser?.FirstName} {gkUser?.LastName}",
            fieldName: match.FieldName,
            matchDateTime: match.MatchDateTime);

        return Ok(new { message = "Booking declined, payment released" });
    }

    [HttpGet("my-requests")]
    [Microsoft.AspNetCore.Authorization.Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> GetMyRequests()
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var gkProfile = await _context.GoalkeeperProfiles.FirstOrDefaultAsync(g => g.UserId == userId);
        if (gkProfile == null) return NotFound(new { error = "Profile not found" });

        var bookings = await _context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .Include(m => m.Payment)
            .Where(m => m.AcceptedGoalkeeperId == gkProfile.Id
                && (m.Payment == null || m.Payment.Status != PaymentStatus.Pending))
            .OrderByDescending(m => m.CreatedAt)
            .Select(m => new
            {
                id = m.Id,
                captainName = m.TeamProfile.User.FirstName + " " + m.TeamProfile.User.LastName,
                captainEmail = m.TeamProfile.User.Email,
                captainPhone = m.TeamProfile.User.PhoneNumber,
                fieldName = m.FieldName,
                fieldAddress = m.FieldAddress,
                matchDateTime = m.MatchDateTime,
                durationMinutes = m.DurationMinutes,
                paymentAmount = m.PaymentAmount,
                notes = m.Notes,
                status = m.Status.ToString(),
                createdAt = m.CreatedAt,
            })
            .ToListAsync();

        return Ok(bookings);
    }

    /// Captain cancels after goalkeeper accepted — 50% refund only (one-time, token-based)
    [HttpPut("{id}/captain-cancel")]
    public async Task<IActionResult> CaptainCancel(Guid id, [FromQuery] string token)
    {
        var match = await _context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .FirstOrDefaultAsync(m => m.Id == id);
        if (match == null) return NotFound(new { error = "Booking not found" });

        if (string.IsNullOrEmpty(token) || !(match.Notes ?? "").Contains($"[CONFIRM_TOKEN:{token}]"))
            return BadRequest(new { error = "Invalid cancellation token" });

        if (match.Status != MatchStatus.Accepted)
            return BadRequest(new { error = "Can only cancel accepted bookings" });

        if (match.MatchDateTime <= DateTime.UtcNow.AddHours(1))
            return BadRequest(new { error = "Cancellations are not allowed within 1 hour of the match start time." });

        if ((match.Notes ?? "").Contains("[CAPTAIN_CANCELLED]"))
            return BadRequest(new { error = "This booking has already been cancelled" });

        var payment = await _context.Payments.FirstOrDefaultAsync(p => p.MatchId == id);
        if (payment != null)
        {
            try
            {
                // Refund 50% only
                var refundService = new RefundService();
                await refundService.CreateAsync(new RefundCreateOptions
                {
                    PaymentIntent = payment.StripePaymentIntentId,
                    Amount = (long)(payment.Amount * 100) / 2,
                    Reason = "requested_by_customer",
                });
                payment.Status = PaymentStatus.Refunded;
            }
            catch (StripeException ex)
            {
                return BadRequest(new { error = $"Refund failed: {ex.Message}" });
            }
        }

        match.Status = MatchStatus.Cancelled;
        match.Notes = (match.Notes ?? "") + "\n[CAPTAIN_CANCELLED]";
        match.UpdatedAt = DateTime.UtcNow;
        await _context.SaveChangesAsync();

        // Notify goalkeeper
        var gkProfile = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .FirstOrDefaultAsync(g => g.Id == match.AcceptedGoalkeeperId);

        if (gkProfile != null)
        {
            _context.Notifications.Add(new Notification
            {
                UserId = gkProfile.UserId,
                Title = "Booking Cancelled",
                Message = $"The booking for {match.FieldName} on {match.MatchDateTime:MMM dd} has been cancelled by the captain.",
                Type = NotificationType.MatchCancelled,
            });
            await _context.SaveChangesAsync();
        }

        return Ok(new { message = "Booking cancelled. 50% has been refunded." });
    }

    /// Goalkeeper cancels an accepted booking — 100% refund to captain
    [HttpPut("{id}/goalkeeper-cancel")]
    [Microsoft.AspNetCore.Authorization.Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> GoalkeeperCancel(Guid id)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var gkProfile = await _context.GoalkeeperProfiles.FirstOrDefaultAsync(g => g.UserId == userId);
        if (gkProfile == null) return NotFound(new { error = "Profile not found" });

        var match = await _context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .FirstOrDefaultAsync(m => m.Id == id && m.AcceptedGoalkeeperId == gkProfile.Id);
        if (match == null) return NotFound(new { error = "Booking not found" });

        if (match.Status != MatchStatus.Accepted && match.Status != MatchStatus.Open)
            return BadRequest(new { error = "Cannot cancel this booking in its current state" });

        if (match.MatchDateTime <= DateTime.UtcNow.AddHours(1))
            return BadRequest(new { error = "Cancellations are not allowed within 1 hour of the match start time." });

        var payment = await _context.Payments.FirstOrDefaultAsync(p => p.MatchId == id);
        if (payment != null)
        {
            try
            {
                if (payment.Status == PaymentStatus.Captured)
                {
                    var refundService = new RefundService();
                    await refundService.CreateAsync(new RefundCreateOptions
                    {
                        PaymentIntent = payment.StripePaymentIntentId,
                        Reason = "requested_by_customer",
                    });
                }
                else if (payment.Status == PaymentStatus.Authorized)
                {
                    var piService = new PaymentIntentService();
                    await piService.CancelAsync(payment.StripePaymentIntentId);
                }
                payment.Status = PaymentStatus.Refunded;
            }
            catch (StripeException ex)
            {
                return BadRequest(new { error = $"Refund failed: {ex.Message}" });
            }
        }

        match.Status = MatchStatus.Cancelled;
        match.Notes = (match.Notes ?? "") + "\n[GOALKEEPER_CANCELLED]";
        match.UpdatedAt = DateTime.UtcNow;
        await _context.SaveChangesAsync();

        var gkUser = await _context.Users.FindAsync(gkProfile.UserId);
        _ = _emailService.SendGoalkeeperCancelledEmail(
            captainEmail: match.TeamProfile.User.Email,
            captainName: $"{match.TeamProfile.User.FirstName} {match.TeamProfile.User.LastName}",
            goalkeeperName: $"{gkUser?.FirstName} {gkUser?.LastName}",
            fieldName: match.FieldName,
            matchDateTime: match.MatchDateTime);

        return Ok(new { message = "Booking cancelled. Captain will receive a full refund." });
    }

    private async Task<Guid> GetOrCreateGuestTeamProfileId(string name, string email, string phone)
    {
        var existingUser = await _context.Users.FirstOrDefaultAsync(u => u.Email == email);

        if (existingUser != null)
        {
            existingUser.PhoneNumber = phone;
            var existingProfile = await _context.TeamProfiles.FirstOrDefaultAsync(t => t.UserId == existingUser.Id);
            if (existingProfile != null)
                return existingProfile.Id;

            var newProfile = new TeamProfile { UserId = existingUser.Id, TeamName = $"{existingUser.FirstName}'s Team" };
            _context.TeamProfiles.Add(newProfile);
            await _context.SaveChangesAsync();
            return newProfile.Id;
        }

        var user = new User
        {
            Email = email,
            PasswordHash = BCrypt.Net.BCrypt.HashPassword(Guid.NewGuid().ToString()),
            FirstName = name.Split(' ').FirstOrDefault() ?? name,
            LastName = name.Split(' ').Skip(1).FirstOrDefault() ?? "",
            PhoneNumber = phone,
            Role = UserRole.TeamCaptain,
            IsActive = true,
        };
        _context.Users.Add(user);

        var teamProfile = new TeamProfile
        {
            UserId = user.Id,
            TeamName = $"{user.FirstName}'s Team",
        };
        _context.TeamProfiles.Add(teamProfile);

        await _context.SaveChangesAsync();
        return teamProfile.Id;
    }

    private static decimal GetProvincialTaxRate(string provinceCode)
    {
        return (provinceCode?.ToUpper()) switch
        {
            "ON" => 0.13m,
            "BC" => 0.12m,
            "AB" => 0.05m,
            "QC" => 0.14975m,
            "MB" => 0.12m,
            "SK" => 0.11m,
            "NS" => 0.14m,
            "NB" => 0.15m,
            "NL" => 0.15m,
            "PE" => 0.15m,
            "NT" => 0.05m,
            "NU" => 0.05m,
            "YT" => 0.05m,
            _ => 0.13m,
        };
    }
}

public record CreateBookingRequest(
    Guid GoalkeeperProfileId,
    string FieldName,
    string FieldAddress,
    double FieldLatitude,
    double FieldLongitude,
    DateTime MatchDateTime,
    int DurationMinutes,
    string CaptainName,
    string CaptainEmail,
    string CaptainPhone,
    string? ProvinceCode,
    string? Notes
);
