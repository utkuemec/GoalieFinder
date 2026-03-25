using GoalieFinder.Infrastructure.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class VerificationController : ControllerBase
{
    private readonly IVerificationService _verificationService;
    private readonly IWebHostEnvironment _env;

    public VerificationController(IVerificationService verificationService, IWebHostEnvironment env)
    {
        _verificationService = verificationService;
        _env = env;
    }

    [HttpPost("send")]
    [EnableRateLimiting("verification")]
    public async Task<IActionResult> SendCode([FromBody] SendCodeRequest request)
    {
        if (string.IsNullOrWhiteSpace(request.Email))
            return BadRequest(new { error = "Email is required" });

        var (success, code) = await _verificationService.SendVerificationCodeAsync(request.Email);

        if (!success)
            return StatusCode(500, new { error = "Failed to send verification code" });

        // Only return code in Development mode for testing
        if (code != null && _env.IsDevelopment())
            return Ok(new { message = "Verification code generated", code });

        return Ok(new { message = "Verification code sent to your email" });
    }

    [HttpPost("verify")]
    [EnableRateLimiting("verification")]
    public IActionResult VerifyCode([FromBody] VerifyCodeRequest request)
    {
        if (string.IsNullOrWhiteSpace(request.Email) || string.IsNullOrWhiteSpace(request.Code))
            return BadRequest(new { error = "Email and code are required" });

        var valid = _verificationService.VerifyCode(request.Email, request.Code);

        if (!valid)
            return BadRequest(new { error = "Invalid or expired code" });

        return Ok(new { verified = true });
    }
}

public record SendCodeRequest(string Email);
public record VerifyCodeRequest(string Email, string Code);
