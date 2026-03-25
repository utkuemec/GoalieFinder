using GoalieFinder.Application.Common.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
[EnableRateLimiting("general")]
public class PaymentsController : ControllerBase
{
    private readonly IConfiguration _configuration;

    public PaymentsController(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    [HttpGet("config")]
    public IActionResult GetConfig()
    {
        return Ok(new { publishableKey = _configuration["Stripe:PublishableKey"] });
    }
}
