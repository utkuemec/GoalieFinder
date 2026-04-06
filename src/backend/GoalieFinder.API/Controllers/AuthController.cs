using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.DTOs;
using GoalieFinder.Application.Features.Auth;
using GoalieFinder.Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;
using System.Net.Http.Headers;
using System.Text.Json;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
[EnableRateLimiting("auth")]
public class AuthController : ControllerBase
{
    private readonly IMediator _mediator;
    private readonly IApplicationDbContext _context;
    private readonly ITokenService _tokenService;

    public AuthController(IMediator mediator, IApplicationDbContext context, ITokenService tokenService)
    {
        _mediator = mediator;
        _context = context;
        _tokenService = tokenService;
    }

    [HttpPost("register")]
    public async Task<IActionResult> Register([FromBody] RegisterRequest request)
    {
        var result = await _mediator.Send(new RegisterCommand(request));
        return result.IsSuccess
            ? StatusCode(result.StatusCode, result.Data)
            : StatusCode(result.StatusCode, new { error = result.Error });
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginRequest request)
    {
        var result = await _mediator.Send(new LoginCommand(request));
        return result.IsSuccess
            ? Ok(result.Data)
            : StatusCode(result.StatusCode, new { error = result.Error });
    }

    [HttpPost("google")]
    public async Task<IActionResult> GoogleAuth([FromBody] GoogleAuthRequest request)
    {
        if (string.IsNullOrEmpty(request.AccessToken))
            return BadRequest(new { error = "Access token is required" });

        // Verify the token with Google and get user info
        using var httpClient = new HttpClient();
        httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", request.AccessToken);

        var response = await httpClient.GetAsync("https://www.googleapis.com/oauth2/v3/userinfo");
        if (!response.IsSuccessStatusCode)
            return BadRequest(new { error = "Invalid Google access token" });

        var json = await response.Content.ReadAsStringAsync();
        var googleUser = JsonSerializer.Deserialize<GoogleUserInfo>(json);

        if (googleUser == null || string.IsNullOrEmpty(googleUser.email))
            return BadRequest(new { error = "Could not retrieve Google user info" });

        // Check if user exists
        var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == googleUser.email);

        if (user != null)
        {
            // Check if this user has a complete goalkeeper profile (price > 0)
            var gkProfile = await _context.GoalkeeperProfiles
                .FirstOrDefaultAsync(g => g.UserId == user.Id);

            if (gkProfile == null || gkProfile.PricePerMatch <= 0)
            {
                // Incomplete registration — delete the ghost user and treat as new
                if (gkProfile != null) _context.GoalkeeperProfiles.Remove(gkProfile);
                _context.Users.Remove(user);
                await _context.SaveChangesAsync();
            }
            else
            {
                // Fully registered user — log them in
                var accessToken = _tokenService.GenerateAccessToken(user);
                var refreshToken = _tokenService.GenerateRefreshToken();
                var userDto = new UserDto(user.Id, user.Email, user.FirstName, user.LastName,
                    user.PhoneNumber, user.ProfilePhotoUrl, user.Role.ToString(), user.IsVerified);

                return Ok(new AuthResponse(accessToken, refreshToken, userDto));
            }
        }

        // New user (or cleaned up ghost) — return Google info for frontend to complete signup
        return Ok(new
        {
            isNewUser = true,
            googleUser = new
            {
                email = googleUser.email,
                firstName = googleUser.given_name ?? "",
                lastName = googleUser.family_name ?? "",
                profilePhotoUrl = googleUser.picture ?? "",
                emailVerified = googleUser.email_verified,
            }
        });
    }

    [HttpPost("google/complete-registration")]
    public async Task<IActionResult> GoogleCompleteRegistration([FromBody] GoogleCompleteRequest request)
    {
        if (string.IsNullOrEmpty(request.GoogleAccessToken))
            return BadRequest(new { error = "Google access token is required" });

        using var httpClient = new HttpClient();
        httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", request.GoogleAccessToken);

        var response = await httpClient.GetAsync("https://www.googleapis.com/oauth2/v3/userinfo");
        if (!response.IsSuccessStatusCode)
            return BadRequest(new { error = "Invalid Google access token" });

        var json = await response.Content.ReadAsStringAsync();
        var googleUser = JsonSerializer.Deserialize<GoogleUserInfo>(json);

        if (googleUser == null || string.IsNullOrEmpty(googleUser.email))
            return BadRequest(new { error = "Could not retrieve Google user info" });

        var existing = await _context.Users.FirstOrDefaultAsync(u => u.Email == googleUser.email);
        if (existing != null)
            return Conflict(new { error = "An account with this email already exists" });

        if (request.PricePerMatch < 10)
            return BadRequest(new { error = "Price must be at least $10" });

        var newUser = new User
        {
            Email = googleUser.email,
            PasswordHash = "GOOGLE_AUTH",
            FirstName = googleUser.given_name ?? request.FirstName ?? "",
            LastName = googleUser.family_name ?? request.LastName ?? "",
            PhoneNumber = request.PhoneNumber ?? "",
            ProfilePhotoUrl = googleUser.picture,
            Role = UserRole.Goalkeeper,
            IsVerified = true,
            IsActive = true,
        };

        _context.Users.Add(newUser);
        _context.GoalkeeperProfiles.Add(new GoalkeeperProfile
        {
            UserId = newUser.Id,
            PricePerMatch = request.PricePerMatch,
            ExperienceYears = request.ExperienceYears,
            Bio = request.Bio ?? "",
            City = request.City,
            Latitude = request.Latitude,
            Longitude = request.Longitude,
            MaxTravelDistanceKm = request.MaxTravelDistanceKm,
            IsAvailable = true,
        });

        await _context.SaveChangesAsync();

        var token = _tokenService.GenerateAccessToken(newUser);
        var refresh = _tokenService.GenerateRefreshToken();
        var dto = new UserDto(newUser.Id, newUser.Email, newUser.FirstName, newUser.LastName,
            newUser.PhoneNumber, newUser.ProfilePhotoUrl, newUser.Role.ToString(), newUser.IsVerified);

        return Ok(new AuthResponse(token, refresh, dto));
    }

    [HttpPost("reset-password")]
    public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordRequest request)
    {
        if (string.IsNullOrEmpty(request.VerificationCode))
            return BadRequest(new { error = "Verification code is required" });

        // Verify the code first
        var verificationService = HttpContext.RequestServices.GetRequiredService<GoalieFinder.Infrastructure.Services.IVerificationService>();
        if (!verificationService.VerifyCode(request.Email, request.VerificationCode))
            return BadRequest(new { error = "Invalid or expired verification code" });

        var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == request.Email);
        if (user == null)
            return BadRequest(new { error = "No account found with this email" });

        if (request.NewPassword.Length < 8)
            return BadRequest(new { error = "Password must be at least 8 characters" });

        user.PasswordHash = BCrypt.Net.BCrypt.HashPassword(request.NewPassword);
        user.UpdatedAt = DateTime.UtcNow;
        await _context.SaveChangesAsync();

        return Ok(new { message = "Password reset successfully" });
    }
}

public record GoogleAuthRequest(string AccessToken);
public record GoogleCompleteRequest(
    string GoogleAccessToken,
    string? FirstName,
    string? LastName,
    string? PhoneNumber,
    decimal PricePerMatch,
    int ExperienceYears,
    string? Bio,
    string? City,
    double Latitude,
    double Longitude,
    int MaxTravelDistanceKm
);
public record ResetPasswordRequest(string Email, string NewPassword, string? VerificationCode);

public class GoogleUserInfo
{
    public string? email { get; set; }
    public string? given_name { get; set; }
    public string? family_name { get; set; }
    public string? picture { get; set; }
    public bool email_verified { get; set; }
}
