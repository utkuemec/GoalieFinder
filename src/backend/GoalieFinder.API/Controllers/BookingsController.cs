using System.Security.Claims;
using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Domain.Entities;
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

    public BookingsController(IApplicationDbContext context, IConfiguration configuration)
    {
        _context = context;
        _configuration = configuration;
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
        var totalAmount = amount + platformFee;

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
            TotalAmount = totalAmount,
            Notes = $"Booked by {request.CaptainName} ({request.CaptainPhone}). {request.Notes ?? ""}".Trim(),
            Status = MatchStatus.Open,
            AcceptedGoalkeeperId = gkProfile.Id,
            TeamProfileId = await GetOrCreateGuestTeamProfileId(request.CaptainName, request.CaptainPhone),
        };

        _context.Matches.Add(match);

        var payment = new Payment
        {
            MatchId = match.Id,
            StripePaymentIntentId = paymentIntent.Id,
            Amount = totalAmount,
            PlatformFee = platformFee,
            GoalkeeperPayout = amount,
            Status = PaymentStatus.Pending,
        };

        _context.Payments.Add(payment);

        _context.Notifications.Add(new Notification
        {
            UserId = gkProfile.UserId,
            Title = "New Booking Request!",
            Message = $"{request.CaptainName} wants to book you for {request.FieldName} on {request.MatchDateTime:MMM dd 'at' HH:mm}",
            Type = NotificationType.MatchRequest,
            Data = System.Text.Json.JsonSerializer.Serialize(new { matchId = match.Id }),
        });

        await _context.SaveChangesAsync();

        return Ok(new
        {
            bookingId = match.Id,
            clientSecret = paymentIntent.ClientSecret,
            amount = totalAmount,
            goalkeeperName = $"{gkProfile.User.FirstName} {gkProfile.User.LastName}",
            goalkeeperPrice = amount,
        });
    }

    [HttpPut("{id}/accept")]
    [Microsoft.AspNetCore.Authorization.Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> AcceptBooking(Guid id)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var gkProfile = await _context.GoalkeeperProfiles.FirstOrDefaultAsync(g => g.UserId == userId);
        if (gkProfile == null) return NotFound(new { error = "Profile not found" });

        var match = await _context.Matches.FirstOrDefaultAsync(m => m.Id == id && m.AcceptedGoalkeeperId == gkProfile.Id);
        if (match == null) return NotFound(new { error = "Booking not found" });
        if (match.Status != MatchStatus.Open) return BadRequest(new { error = "Booking is no longer pending" });

        var payment = await _context.Payments.FirstOrDefaultAsync(p => p.MatchId == id);
        if (payment == null) return BadRequest(new { error = "Payment not found" });

        try
        {
            var piService = new PaymentIntentService();
            await piService.CaptureAsync(payment.StripePaymentIntentId);
            payment.Status = PaymentStatus.Captured;
            payment.CompletedAt = DateTime.UtcNow;
        }
        catch (StripeException ex)
        {
            return BadRequest(new { error = $"Payment capture failed: {ex.Message}" });
        }

        match.Status = MatchStatus.Accepted;
        match.UpdatedAt = DateTime.UtcNow;

        await _context.SaveChangesAsync();

        return Ok(new { message = "Booking accepted, payment captured" });
    }

    [HttpPut("{id}/decline")]
    [Microsoft.AspNetCore.Authorization.Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> DeclineBooking(Guid id)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var gkProfile = await _context.GoalkeeperProfiles.FirstOrDefaultAsync(g => g.UserId == userId);
        if (gkProfile == null) return NotFound(new { error = "Profile not found" });

        var match = await _context.Matches.FirstOrDefaultAsync(m => m.Id == id && m.AcceptedGoalkeeperId == gkProfile.Id);
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
            catch { }
        }

        match.Status = MatchStatus.Cancelled;
        match.UpdatedAt = DateTime.UtcNow;

        await _context.SaveChangesAsync();

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
            .Where(m => m.AcceptedGoalkeeperId == gkProfile.Id)
            .OrderByDescending(m => m.CreatedAt)
            .Select(m => new
            {
                id = m.Id,
                captainName = m.TeamProfile.User.FirstName + " " + m.TeamProfile.User.LastName,
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

    private async Task<Guid> GetOrCreateGuestTeamProfileId(string name, string phone)
    {
        var guestEmail = $"guest-{Guid.NewGuid():N}@goaliefinder.local";
        var user = new User
        {
            Email = guestEmail,
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
    string CaptainPhone,
    string? Notes
);
