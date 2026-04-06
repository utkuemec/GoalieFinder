using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Domain.Entities;
using GoalieFinder.Infrastructure.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Stripe;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(Roles = "Admin")]
public class AdminController : ControllerBase
{
    private readonly IApplicationDbContext _context;
    private readonly IBookingEmailService _emailService;

    public AdminController(IApplicationDbContext context, IBookingEmailService emailService)
    {
        _context = context;
        _emailService = emailService;
    }

    [HttpGet("bookings")]
    public async Task<IActionResult> GetAllBookings(
        [FromQuery] string? status = null,
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 50)
    {
        var query = _context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .Include(m => m.AcceptedGoalkeeper).ThenInclude(g => g!.User)
            .Include(m => m.Payment)
            .AsQueryable();

        if (!string.IsNullOrEmpty(status) && Enum.TryParse<MatchStatus>(status, true, out var parsed))
            query = query.Where(m => m.Status == parsed);

        var total = await query.CountAsync();

        var bookings = await query
            .OrderByDescending(m => m.CreatedAt)
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .Select(m => new
            {
                m.Id,
                m.Status,
                statusText = m.Status.ToString(),
                m.FieldName,
                m.FieldAddress,
                m.MatchDateTime,
                m.DurationMinutes,
                captain = new
                {
                    name = m.TeamProfile.User.FirstName + " " + m.TeamProfile.User.LastName,
                    email = m.TeamProfile.User.Email,
                    phone = m.TeamProfile.User.PhoneNumber,
                },
                goalkeeper = m.AcceptedGoalkeeper == null ? null : new
                {
                    id = m.AcceptedGoalkeeper.Id,
                    name = m.AcceptedGoalkeeper.User.FirstName + " " + m.AcceptedGoalkeeper.User.LastName,
                    email = m.AcceptedGoalkeeper.User.Email,
                    phone = m.AcceptedGoalkeeper.User.PhoneNumber,
                    city = m.AcceptedGoalkeeper.City,
                    pricePerMatch = m.AcceptedGoalkeeper.PricePerMatch,
                },
                payment = m.Payment == null ? null : new
                {
                    m.Payment.Id,
                    statusText = m.Payment.Status.ToString(),
                    m.Payment.Amount,
                    m.Payment.PlatformFee,
                    m.Payment.TaxAmount,
                    m.Payment.StripeFee,
                    m.Payment.GoalkeeperPayout,
                    m.Payment.StripePaymentIntentId,
                    m.Payment.StripeTransferId,
                    m.Payment.CompletedAt,
                },
                m.PaymentAmount,
                m.PlatformFee,
                m.TaxRate,
                m.TaxAmount,
                m.StripeFee,
                m.TotalAmount,
                m.Notes,
                m.CreatedAt,
                m.UpdatedAt,
            })
            .ToListAsync();

        return Ok(new { total, page, pageSize, bookings });
    }

    [HttpGet("goalkeepers")]
    public async Task<IActionResult> GetAllGoalkeepers([FromQuery] int page = 1, [FromQuery] int pageSize = 50)
    {
        var total = await _context.GoalkeeperProfiles.CountAsync();

        var goalkeepers = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .OrderByDescending(g => g.CreatedAt)
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .Select(g => new
            {
                g.Id,
                g.UserId,
                name = g.User.FirstName + " " + g.User.LastName,
                g.User.Email,
                g.User.PhoneNumber,
                g.City,
                g.PricePerMatch,
                g.ExperienceYears,
                g.Rating,
                g.TotalMatches,
                g.TotalReviews,
                g.IsAvailable,
                g.MaxTravelDistanceKm,
                g.Latitude,
                g.Longitude,
                hasStripeConnect = !string.IsNullOrEmpty(g.User.StripeConnectAccountId),
                stripeAccountId = g.User.StripeConnectAccountId,
                g.CreatedAt,
            })
            .ToListAsync();

        return Ok(new { total, page, pageSize, goalkeepers });
    }

    [HttpGet("users")]
    public async Task<IActionResult> GetAllUsers([FromQuery] int page = 1, [FromQuery] int pageSize = 50)
    {
        var total = await _context.Users.CountAsync();

        var users = await _context.Users
            .OrderByDescending(u => u.CreatedAt)
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .Select(u => new
            {
                u.Id,
                u.Email,
                u.FirstName,
                u.LastName,
                u.PhoneNumber,
                role = u.Role.ToString(),
                u.IsVerified,
                u.IsActive,
                hasStripeConnect = !string.IsNullOrEmpty(u.StripeConnectAccountId),
                u.CreatedAt,
            })
            .ToListAsync();

        return Ok(new { total, page, pageSize, users });
    }

    [HttpPost("send-reminder-emails")]
    [AllowAnonymous]
    public async Task<IActionResult> SendPayoutReminderEmails([FromBody] SendReminderRequest request, [FromServices] IConfiguration config)
    {
        var adminSecret = config["Admin:SecretKey"];
        if (string.IsNullOrEmpty(adminSecret) || request.SecretKey != adminSecret)
            return Unauthorized(new { error = "Invalid admin secret key" });

        var goalkeepers = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .Where(g => g.User.IsActive && g.User.Role == UserRole.Goalkeeper)
            .ToListAsync();

        var sent = 0;
        var errors = 0;

        foreach (var gk in goalkeepers)
        {
            var hasCompletedPayout = !string.IsNullOrEmpty(gk.User.StripeConnectAccountId);
            var name = $"{gk.User.FirstName} {gk.User.LastName}".Trim();
            if (string.IsNullOrEmpty(name)) name = "Goalkeeper";

            try
            {
                await _emailService.SendPayoutSetupReminderEmail(gk.User.Email, name, hasCompletedPayout);
                sent++;
            }
            catch
            {
                errors++;
            }

            await Task.Delay(500);
        }

        return Ok(new { message = $"Reminder emails sent to {sent} goalkeepers ({errors} failed)", totalGoalkeepers = goalkeepers.Count, sent, errors });
    }

    /// Promote a user to Admin role — requires the platform admin secret key
    [HttpPost("promote")]
    [AllowAnonymous]
    public async Task<IActionResult> PromoteToAdmin([FromBody] PromoteRequest request, [FromServices] IConfiguration config)
    {
        var adminSecret = config["Admin:SecretKey"];
        if (string.IsNullOrEmpty(adminSecret) || request.SecretKey != adminSecret)
            return Unauthorized(new { error = "Invalid admin secret key" });

        var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == request.Email);
        if (user == null)
            return NotFound(new { error = "User not found" });

        user.Role = UserRole.Admin;
        user.UpdatedAt = DateTime.UtcNow;
        await _context.SaveChangesAsync();

        return Ok(new { message = $"{user.Email} promoted to Admin" });
    }

    [HttpGet("stats")]
    public async Task<IActionResult> GetStats()
    {
        var totalUsers = await _context.Users.CountAsync();
        var totalGoalkeepers = await _context.GoalkeeperProfiles.CountAsync();
        var totalBookings = await _context.Matches.CountAsync();
        var activeBookings = await _context.Matches.CountAsync(m => m.Status == MatchStatus.Accepted);
        var completedBookings = await _context.Matches.CountAsync(m => m.Status == MatchStatus.Completed);
        var cancelledBookings = await _context.Matches.CountAsync(m => m.Status == MatchStatus.Cancelled);
        var pendingBookings = await _context.Matches.CountAsync(m => m.Status == MatchStatus.Open);

        var totalRevenue = await _context.Payments
            .Where(p => p.Status == PaymentStatus.Released || p.Status == PaymentStatus.Captured)
            .SumAsync(p => p.Amount);
        var totalPlatformFees = await _context.Payments
            .Where(p => p.Status == PaymentStatus.Released || p.Status == PaymentStatus.Captured)
            .SumAsync(p => p.PlatformFee);
        var totalGoalkeeperPayouts = await _context.Payments
            .Where(p => p.Status == PaymentStatus.Released)
            .SumAsync(p => p.GoalkeeperPayout);

        return Ok(new
        {
            totalUsers,
            totalGoalkeepers,
            bookings = new { total = totalBookings, active = activeBookings, completed = completedBookings, cancelled = cancelledBookings, pending = pendingBookings },
            revenue = new { total = totalRevenue, platformFees = totalPlatformFees, goalkeeperPayouts = totalGoalkeeperPayouts },
        });
    }

    [HttpPost("trigger-payout")]
    [AllowAnonymous]
    public async Task<IActionResult> TriggerPayout([FromBody] TriggerPayoutRequest request, [FromServices] IConfiguration config)
    {
        var adminSecret = config["Admin:SecretKey"];
        if (string.IsNullOrEmpty(adminSecret) || request.SecretKey != adminSecret)
            return Unauthorized(new { error = "Invalid admin secret key" });

        StripeConfiguration.ApiKey = config["Stripe:SecretKey"];

        var match = await _context.Matches
            .Include(m => m.Payment)
            .FirstOrDefaultAsync(m => m.Id == request.MatchId);
        if (match == null)
            return NotFound(new { error = "Match not found" });

        var payment = await _context.Payments.FirstOrDefaultAsync(p => p.MatchId == match.Id);
        if (payment == null)
            return NotFound(new { error = "Payment not found" });

        if (!string.IsNullOrEmpty(payment.StripeTransferId))
            return Ok(new { message = "Transfer already exists", transferId = payment.StripeTransferId, paymentStatus = payment.Status.ToString() });

        var gkProfile = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .FirstOrDefaultAsync(g => g.Id == match.AcceptedGoalkeeperId);
        if (gkProfile == null)
            return NotFound(new { error = "Goalkeeper profile not found" });

        if (string.IsNullOrEmpty(gkProfile.User.StripeConnectAccountId))
            return BadRequest(new { error = "Goalkeeper has no Stripe Connect account" });

        var chargeId = payment.StripeChargeId;
        if (string.IsNullOrEmpty(chargeId))
        {
            var piService = new PaymentIntentService();
            var pi = await piService.GetAsync(payment.StripePaymentIntentId);
            chargeId = pi.LatestChargeId;
            payment.StripeChargeId = chargeId;
        }

        try
        {
            var transferOpts = new TransferCreateOptions
            {
                Amount = (long)(match.PaymentAmount * 100),
                Currency = "cad",
                Destination = gkProfile.User.StripeConnectAccountId,
                TransferGroup = payment.StripePaymentIntentId,
                Description = $"Manual payout for match at {match.FieldName} on {match.MatchDateTime:MMM dd}",
            };
            if (!string.IsNullOrEmpty(chargeId))
                transferOpts.SourceTransaction = chargeId;

            var transferService = new TransferService();
            var transfer = await transferService.CreateAsync(transferOpts);
            payment.StripeTransferId = transfer.Id;
            payment.Status = PaymentStatus.Released;
            payment.CompletedAt = DateTime.UtcNow;

            match.Status = MatchStatus.Completed;
            match.UpdatedAt = DateTime.UtcNow;
            gkProfile.TotalMatches++;

            await _context.SaveChangesAsync();

            try
            {
                await _emailService.SendPaymentReleasedEmail(
                    gkProfile.User.Email,
                    $"{gkProfile.User.FirstName} {gkProfile.User.LastName}",
                    match.FieldName,
                    match.MatchDateTime,
                    match.PaymentAmount);
            }
            catch { }

            return Ok(new
            {
                message = "Payout triggered successfully",
                transferId = transfer.Id,
                amount = match.PaymentAmount,
                chargeId,
                destination = gkProfile.User.StripeConnectAccountId,
                goalkeeperName = $"{gkProfile.User.FirstName} {gkProfile.User.LastName}",
            });
        }
        catch (StripeException ex)
        {
            return BadRequest(new { error = $"Transfer failed: {ex.Message}", stripeCode = ex.StripeError?.Code });
        }
    }
}

public record PromoteRequest(string Email, string SecretKey);
public record SendReminderRequest(string SecretKey);
public record TriggerPayoutRequest(Guid MatchId, string SecretKey);
