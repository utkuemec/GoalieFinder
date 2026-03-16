using GoalieFinder.Application.Common.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PaymentsController : ControllerBase
{
    private readonly IPaymentService _paymentService;
    private readonly IConfiguration _configuration;

    public PaymentsController(IPaymentService paymentService, IConfiguration configuration)
    {
        _paymentService = paymentService;
        _configuration = configuration;
    }

    [HttpGet("config")]
    public IActionResult GetConfig()
    {
        return Ok(new { publishableKey = _configuration["Stripe:PublishableKey"] });
    }

    [HttpPost("create-payment-intent")]
    public async Task<IActionResult> CreatePaymentIntent([FromBody] CreatePaymentRequest request)
    {
        if (request.Amount < 10)
            return BadRequest(new { error = "Minimum payment is $10" });

        var metadata = new Dictionary<string, string>
        {
            { "matchId", request.MatchId ?? "" },
            { "purpose", "goalkeeper_payment" }
        };

        var clientSecret = await _paymentService.CreatePaymentIntentAsync(
            request.Amount, "cad", request.CustomerId ?? "", metadata);

        return Ok(new { clientSecret });
    }

    [HttpPost("create-connect-account")]
    public async Task<IActionResult> CreateConnectAccount([FromBody] CreateConnectAccountRequest request)
    {
        var accountId = await _paymentService.CreateConnectAccountAsync(request.Email);
        return Ok(new { accountId });
    }
}

public record CreatePaymentRequest(decimal Amount, string? MatchId, string? CustomerId);
public record CreateConnectAccountRequest(string Email);
