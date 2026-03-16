using System.Security.Claims;
using GoalieFinder.Application.DTOs;
using GoalieFinder.Application.Features.Matches;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalieFinder.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class MatchesController : ControllerBase
{
    private readonly IMediator _mediator;

    public MatchesController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost]
    [Authorize(Roles = "TeamCaptain")]
    public async Task<IActionResult> CreateMatch([FromBody] CreateMatchRequest request)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var result = await _mediator.Send(new CreateMatchCommand(request, userId));
        return result.IsSuccess
            ? StatusCode(result.StatusCode, result.Data)
            : StatusCode(result.StatusCode, new { error = result.Error });
    }

    [HttpGet("nearby")]
    public async Task<IActionResult> GetNearbyMatches([FromQuery] double lat, [FromQuery] double lng, [FromQuery] double radius = 15, [FromQuery] int page = 1, [FromQuery] int pageSize = 20)
    {
        var query = new NearbyMatchQuery(lat, lng, radius, page, pageSize);
        var result = await _mediator.Send(new GetNearbyMatchesQuery(query));
        return result.IsSuccess ? Ok(result.Data) : StatusCode(result.StatusCode, new { error = result.Error });
    }

    [HttpPost("{id}/accept")]
    [Authorize(Roles = "Goalkeeper")]
    public async Task<IActionResult> AcceptMatch(Guid id)
    {
        var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var result = await _mediator.Send(new AcceptMatchCommand(id, userId));
        return result.IsSuccess ? Ok(result.Data) : StatusCode(result.StatusCode, new { error = result.Error });
    }
}
