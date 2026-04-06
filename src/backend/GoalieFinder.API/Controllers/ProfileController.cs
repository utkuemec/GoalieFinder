using System.Security.Claims;
using GoalieFinder.Application.Common.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class ProfileController : ControllerBase
{
    private readonly IApplicationDbContext _context;

    public ProfileController(IApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<IActionResult> GetProfile()
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var user = await _context.Users.FindAsync(userId);
        if (user == null) return NotFound();

        var gkProfile = await _context.GoalkeeperProfiles.FirstOrDefaultAsync(g => g.UserId == userId);

        var isGoogleUser = string.IsNullOrEmpty(user.PasswordHash) || user.PasswordHash == "GOOGLE_AUTH";

        return Ok(new
        {
            user.Email,
            user.FirstName,
            user.LastName,
            user.PhoneNumber,
            user.ProfilePhotoUrl,
            isGoogleUser,
            goalkeeper = gkProfile == null ? null : new
            {
                gkProfile.PricePerMatch,
                gkProfile.ExperienceYears,
                gkProfile.Bio,
                gkProfile.City,
                gkProfile.Latitude,
                gkProfile.Longitude,
                gkProfile.MaxTravelDistanceKm,
                gkProfile.IsAvailable,
            }
        });
    }

    [HttpPut("personal")]
    public async Task<IActionResult> UpdatePersonalInfo([FromBody] UpdatePersonalRequest request)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var user = await _context.Users.FindAsync(userId);
        if (user == null) return NotFound();

        if (!string.IsNullOrWhiteSpace(request.FirstName)) user.FirstName = request.FirstName;
        if (!string.IsNullOrWhiteSpace(request.LastName)) user.LastName = request.LastName;
        if (!string.IsNullOrWhiteSpace(request.PhoneNumber)) user.PhoneNumber = request.PhoneNumber;
        user.UpdatedAt = DateTime.UtcNow;

        await _context.SaveChangesAsync();
        return Ok(new { message = "Personal info updated" });
    }

    [HttpPut("password")]
    public async Task<IActionResult> ChangePassword([FromBody] ChangePasswordRequest request)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var user = await _context.Users.FindAsync(userId);
        if (user == null) return NotFound();

        if (!BCrypt.Net.BCrypt.Verify(request.CurrentPassword, user.PasswordHash))
            return BadRequest(new { error = "Current password is incorrect" });

        if (request.NewPassword.Length < 8)
            return BadRequest(new { error = "New password must be at least 8 characters" });

        user.PasswordHash = BCrypt.Net.BCrypt.HashPassword(request.NewPassword);
        user.UpdatedAt = DateTime.UtcNow;

        await _context.SaveChangesAsync();
        return Ok(new { message = "Password changed" });
    }

    [HttpPut("goalkeeper")]
    [Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> UpdateGoalkeeperSettings([FromBody] UpdateGoalkeeperRequest request)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var profile = await _context.GoalkeeperProfiles.FirstOrDefaultAsync(g => g.UserId == userId);
        if (profile == null) return NotFound();

        if (request.PricePerMatch.HasValue) profile.PricePerMatch = request.PricePerMatch.Value;
        if (request.ExperienceYears.HasValue) profile.ExperienceYears = request.ExperienceYears.Value;
        if (request.Bio != null) profile.Bio = request.Bio;
        if (request.City != null) profile.City = request.City;
        if (request.Latitude.HasValue) profile.Latitude = request.Latitude.Value;
        if (request.Longitude.HasValue) profile.Longitude = request.Longitude.Value;
        if (request.MaxTravelDistanceKm.HasValue) profile.MaxTravelDistanceKm = request.MaxTravelDistanceKm.Value;
        if (request.IsAvailable.HasValue) profile.IsAvailable = request.IsAvailable.Value;
        profile.UpdatedAt = DateTime.UtcNow;

        await _context.SaveChangesAsync();
        return Ok(new { message = "Goalkeeper settings updated" });
    }

    [HttpDelete]
    public async Task<IActionResult> DeleteAccount([FromBody] DeleteAccountRequest request)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var user = await _context.Users.FindAsync(userId);
        if (user == null) return NotFound();

        if (!string.IsNullOrEmpty(request.Password) && !BCrypt.Net.BCrypt.Verify(request.Password, user.PasswordHash))
            return BadRequest(new { error = "Password is incorrect" });

        user.IsActive = false;
        user.UpdatedAt = DateTime.UtcNow;

        var gkProfile = await _context.GoalkeeperProfiles.FirstOrDefaultAsync(g => g.UserId == userId);
        if (gkProfile != null) gkProfile.IsAvailable = false;

        await _context.SaveChangesAsync();
        return Ok(new { message = "Account deactivated" });
    }
}

public record UpdatePersonalRequest(string? FirstName, string? LastName, string? PhoneNumber);
public record ChangePasswordRequest(string CurrentPassword, string NewPassword);
public record UpdateGoalkeeperRequest(decimal? PricePerMatch, int? ExperienceYears, string? Bio, string? City, double? Latitude, double? Longitude, int? MaxTravelDistanceKm, bool? IsAvailable);
public record DeleteAccountRequest(string? Password);
