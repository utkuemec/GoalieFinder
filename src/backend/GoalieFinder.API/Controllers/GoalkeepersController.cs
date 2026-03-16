using System.Security.Claims;
using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.DTOs;
using GoalieFinder.Application.Features.Goalkeepers;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class GoalkeepersController : ControllerBase
{
    private readonly IMediator _mediator;
    private readonly IApplicationDbContext _context;

    public GoalkeepersController(IMediator mediator, IApplicationDbContext context)
    {
        _mediator = mediator;
        _context = context;
    }

    [HttpGet]
    public async Task<IActionResult> GetAllGoalkeepers([FromQuery] int page = 1, [FromQuery] int pageSize = 50)
    {
        var goalkeepers = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .Where(g => g.IsAvailable && g.User.IsActive)
            .OrderByDescending(g => g.Rating)
            .ThenByDescending(g => g.TotalMatches)
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync();

        var totalCount = await _context.GoalkeeperProfiles
            .Where(g => g.IsAvailable && g.User.IsActive)
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
        [FromQuery] double radius = 15, [FromQuery] int page = 1, [FromQuery] int pageSize = 20)
    {
        var query = new NearbyGoalkeeperQuery(lat, lng, radius, page, pageSize);
        var result = await _mediator.Send(new GetNearbyGoalkeepersQuery(query));
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
}
