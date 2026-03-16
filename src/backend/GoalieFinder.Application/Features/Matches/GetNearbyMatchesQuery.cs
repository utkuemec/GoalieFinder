using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.Common.Models;
using GoalieFinder.Application.DTOs;
using GoalieFinder.Domain.Entities;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.Application.Features.Matches;

public record GetNearbyMatchesQuery(NearbyMatchQuery Query) : IRequest<Result<PagedResult<MatchDto>>>;

public class GetNearbyMatchesQueryHandler : IRequestHandler<GetNearbyMatchesQuery, Result<PagedResult<MatchDto>>>
{
    private readonly IApplicationDbContext _context;

    public GetNearbyMatchesQueryHandler(IApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<Result<PagedResult<MatchDto>>> Handle(GetNearbyMatchesQuery request, CancellationToken cancellationToken)
    {
        var query = request.Query;
        var matches = await _context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .Where(m => m.Status == MatchStatus.Open && m.MatchDateTime > DateTime.UtcNow)
            .ToListAsync(cancellationToken);

        var nearbyMatches = matches
            .Select(m => new
            {
                Match = m,
                Distance = CalculateDistance(query.Latitude, query.Longitude, m.FieldLatitude, m.FieldLongitude)
            })
            .Where(x => x.Distance <= query.RadiusKm)
            .OrderBy(x => x.Distance)
            .ToList();

        var totalCount = nearbyMatches.Count;
        var items = nearbyMatches
            .Skip((query.Page - 1) * query.PageSize)
            .Take(query.PageSize)
            .Select(x => new MatchDto(
                x.Match.Id, x.Match.TeamProfileId, x.Match.TeamProfile.TeamName, x.Match.TeamProfile.Rating,
                x.Match.FieldName, x.Match.FieldAddress, x.Match.FieldLatitude, x.Match.FieldLongitude,
                x.Match.MatchDateTime, x.Match.DurationMinutes, x.Match.PaymentAmount, x.Match.PlatformFee,
                x.Match.TotalAmount, x.Match.Notes, x.Match.Status.ToString(), x.Match.AcceptedGoalkeeperId,
                null, Math.Round(x.Distance, 1), x.Match.CreatedAt))
            .ToList();

        var result = new PagedResult<MatchDto>
        {
            Items = items,
            TotalCount = totalCount,
            Page = query.Page,
            PageSize = query.PageSize
        };

        return Result<PagedResult<MatchDto>>.Success(result);
    }

    private static double CalculateDistance(double lat1, double lon1, double lat2, double lon2)
    {
        const double R = 6371;
        var dLat = ToRad(lat2 - lat1);
        var dLon = ToRad(lon2 - lon1);
        var a = Math.Sin(dLat / 2) * Math.Sin(dLat / 2) +
                Math.Cos(ToRad(lat1)) * Math.Cos(ToRad(lat2)) *
                Math.Sin(dLon / 2) * Math.Sin(dLon / 2);
        var c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));
        return R * c;
    }

    private static double ToRad(double deg) => deg * Math.PI / 180;
}
