using System.Security.Claims;
using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.DTOs;
using GoalieFinder.Application.Features.Goalkeepers;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Stripe;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class GoalkeepersController : ControllerBase
{
    private readonly IMediator _mediator;
    private readonly IApplicationDbContext _context;
    private readonly IConfiguration _configuration;

    public GoalkeepersController(IMediator mediator, IApplicationDbContext context, IConfiguration configuration)
    {
        _mediator = mediator;
        _context = context;
        _configuration = configuration;
        StripeConfiguration.ApiKey = _configuration["Stripe:SecretKey"];
    }

    [HttpGet]
    public async Task<IActionResult> GetAllGoalkeepers([FromQuery] int page = 1, [FromQuery] int pageSize = 50)
    {
        var goalkeepers = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .Where(g => g.IsAvailable && g.User.IsActive && g.User.StripeConnectAccountId != null)
            .OrderByDescending(g => g.Rating)
            .ThenByDescending(g => g.TotalMatches)
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync();

        var totalCount = await _context.GoalkeeperProfiles
            .Where(g => g.IsAvailable && g.User.IsActive && g.User.StripeConnectAccountId != null)
            .CountAsync();

        var items = goalkeepers.Select(g => new GoalkeeperProfileDto(
            g.Id, g.UserId,
            $"{g.User.FirstName} {g.User.LastName}",
            g.User.ProfilePhotoUrl,
            g.PricePerMatch, g.ExperienceYears, g.Bio,
            g.Latitude, g.Longitude, g.MaxTravelDistanceKm,
            g.Rating, g.TotalMatches, g.TotalReviews,
            g.IsAvailable, null)).ToList();

        return Ok(new { items, totalCount, page, pageSize });
    }

    [HttpGet("nearby")]
    public async Task<IActionResult> GetNearbyGoalkeepers(
        [FromQuery] double lat, [FromQuery] double lng,
        [FromQuery] double radius = 15, [FromQuery] int page = 1, [FromQuery] int pageSize = 20,
        [FromQuery] DateTime? matchDate = null)
    {
        var query = new NearbyGoalkeeperQuery(lat, lng, radius, page, pageSize);
        var result = await _mediator.Send(new GetNearbyGoalkeepersQuery(query));

        if (result.IsSuccess && result.Data != null && matchDate.HasValue)
        {
            // Filter out goalkeepers who have accepted bookings overlapping with the requested date/time
            var matchStart = matchDate.Value.AddHours(-2);
            var matchEnd = matchDate.Value.AddHours(2);

            var busyGoalkeeperIds = await _context.Matches
                .Where(m => m.Status == Domain.Entities.MatchStatus.Accepted
                    && m.MatchDateTime >= matchStart
                    && m.MatchDateTime <= matchEnd
                    && m.AcceptedGoalkeeperId != null)
                .Select(m => m.AcceptedGoalkeeperId!.Value)
                .ToListAsync();

            var filtered = result.Data.Items.Where(g => !busyGoalkeeperIds.Contains(g.Id)).ToList();
            result.Data.Items = filtered;
            result.Data.TotalCount = filtered.Count;
        }

        return result.IsSuccess ? Ok(result.Data) : StatusCode(result.StatusCode, new { error = result.Error });
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetGoalkeeperById(Guid id)
    {
        var profile = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .FirstOrDefaultAsync(g => g.Id == id);

        if (profile == null)
            return NotFound(new { error = "Goalkeeper not found" });

        var dto = new GoalkeeperProfileDto(
            profile.Id, profile.UserId,
            $"{profile.User.FirstName} {profile.User.LastName}",
            profile.User.ProfilePhotoUrl,
            profile.PricePerMatch, profile.ExperienceYears, profile.Bio,
            profile.Latitude, profile.Longitude, profile.MaxTravelDistanceKm,
            profile.Rating, profile.TotalMatches, profile.TotalReviews,
            profile.IsAvailable, null);

        return Ok(dto);
    }

    [HttpPut("profile")]
    [Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> UpdateProfile([FromBody] UpdateGoalkeeperProfileRequest request)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);

        var profile = await _context.GoalkeeperProfiles
            .FirstOrDefaultAsync(g => g.UserId == userId);

        if (profile == null)
            return NotFound(new { error = "Goalkeeper profile not found" });

        profile.PricePerMatch = request.PricePerMatch;
        profile.ExperienceYears = request.ExperienceYears;
        profile.Bio = request.Bio;
        profile.Latitude = request.Latitude;
        profile.Longitude = request.Longitude;
        profile.MaxTravelDistanceKm = request.MaxTravelDistanceKm;
        profile.IsAvailable = request.IsAvailable;
        profile.UpdatedAt = DateTime.UtcNow;

        await _context.SaveChangesAsync();

        return Ok(new { message = "Profile updated" });
    }

    [HttpPost("connect/onboard")]
    [Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> CreateConnectAccount([FromBody] PayoutSetupRequest request)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var user = await _context.Users.FindAsync(userId);
        if (user == null) return NotFound(new { error = "User not found" });

        try
        {
            var accountService = new AccountService();

            if (!string.IsNullOrEmpty(user.StripeConnectAccountId))
            {
                // Update existing account with bank info
                await accountService.UpdateAsync(user.StripeConnectAccountId, new AccountUpdateOptions
                {
                    ExternalAccount = new AccountBankAccountOptions
                    {
                        Country = "CA",
                        Currency = "cad",
                        RoutingNumber = request.TransitNumber + request.InstitutionNumber,
                        AccountNumber = request.AccountNumber,
                        AccountHolderName = $"{user.FirstName} {user.LastName}",
                        AccountHolderType = "individual",
                    },
                });

                return Ok(new { message = "Bank account updated", accountId = user.StripeConnectAccountId });
            }

            // Create new Custom account with minimal info
            var account = await accountService.CreateAsync(new AccountCreateOptions
            {
                Type = "custom",
                Country = "CA",
                Email = user.Email,
                Capabilities = new AccountCapabilitiesOptions
                {
                    Transfers = new AccountCapabilitiesTransfersOptions { Requested = true },
                },
                BusinessType = "individual",
                Individual = new AccountIndividualOptions
                {
                    FirstName = user.FirstName,
                    LastName = user.LastName,
                    Email = user.Email,
                    Phone = user.PhoneNumber,
                    IdNumber = string.IsNullOrWhiteSpace(request.SinNumber) ? null : request.SinNumber,
                    Dob = new DobOptions
                    {
                        Day = request.DobDay,
                        Month = request.DobMonth,
                        Year = request.DobYear,
                    },
                    Address = new AddressOptions
                    {
                        Line1 = request.AddressLine1,
                        City = request.City,
                        State = request.Province,
                        PostalCode = request.PostalCode,
                        Country = "CA",
                    },
                    Relationship = new AccountIndividualRelationshipOptions
                    {
                        Title = "Goalkeeper",
                    },
                },
                BusinessProfile = new AccountBusinessProfileOptions
                {
                    Mcc = "7941", // Sports clubs/fields
                    ProductDescription = "Freelance goalkeeper services",
                    Url = "https://goaliefinders.com",
                },
                ExternalAccount = new AccountBankAccountOptions
                {
                    Country = "CA",
                    Currency = "cad",
                    RoutingNumber = request.TransitNumber + request.InstitutionNumber,
                    AccountNumber = request.AccountNumber,
                    AccountHolderName = $"{user.FirstName} {user.LastName}",
                    AccountHolderType = "individual",
                },
                TosAcceptance = new AccountTosAcceptanceOptions
                {
                    Date = DateTime.UtcNow,
                    Ip = HttpContext.Connection.RemoteIpAddress?.ToString(),
                },
            });

            user.StripeConnectAccountId = account.Id;
            await _context.SaveChangesAsync();

            return Ok(new { message = "Payout account created", accountId = account.Id });
        }
        catch (StripeException ex)
        {
            if (ex.Message.Contains("platform-profile") || ex.Message.Contains("responsibilities"))
                return BadRequest(new { error = "Payout setup is temporarily unavailable. Please try again later or contact support." });

            if (ex.Message.Contains("routing_number") || ex.Message.Contains("routing number"))
                return BadRequest(new { error = "Invalid transit or institution number. Please check your bank details." });

            if (ex.Message.Contains("account_number") || ex.Message.Contains("account number"))
                return BadRequest(new { error = "Invalid account number. Please check and try again." });

            return BadRequest(new { error = "Failed to set up payouts. Please double-check your bank details and try again." });
        }
    }

    [HttpGet("connect/status")]
    [Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> GetConnectStatus()
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var user = await _context.Users.FindAsync(userId);
        if (user == null) return NotFound(new { error = "User not found" });

        if (string.IsNullOrEmpty(user.StripeConnectAccountId))
            return Ok(new { connected = false, payoutsEnabled = false, accountId = (string?)null });

        try
        {
            var accountService = new AccountService();
            var account = await accountService.GetAsync(user.StripeConnectAccountId);
            return Ok(new
            {
                connected = true,
                payoutsEnabled = account.PayoutsEnabled,
                chargesEnabled = account.ChargesEnabled,
                accountId = account.Id,
                detailsSubmitted = account.DetailsSubmitted,
            });
        }
        catch
        {
            return Ok(new { connected = false, payoutsEnabled = false, accountId = user.StripeConnectAccountId });
        }
    }
}

public record PayoutSetupRequest(
    int DobDay,
    int DobMonth,
    int DobYear,
    string AddressLine1,
    string City,
    string Province,
    string PostalCode,
    string TransitNumber,
    string InstitutionNumber,
    string AccountNumber,
    string? SinNumber
);
