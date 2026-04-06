using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.Common.Models;
using GoalieFinder.Application.DTOs;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.Application.Features.Goalkeepers;

public record GetNearbyGoalkeepersQuery(NearbyGoalkeeperQuery Query) : IRequest<Result<PagedResult<GoalkeeperProfileDto>>>;

public class GetNearbyGoalkeepersQueryHandler : IRequestHandler<GetNearbyGoalkeepersQuery, Result<PagedResult<GoalkeeperProfileDto>>>
{
    private readonly IApplicationDbContext _context;

    public GetNearbyGoalkeepersQueryHandler(IApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<Result<PagedResult<GoalkeeperProfileDto>>> Handle(GetNearbyGoalkeepersQuery request, CancellationToken cancellationToken)
    {
        var query = request.Query;
        var goalkeepers = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .Where(g => g.IsAvailable && g.User.IsActive && g.User.StripeConnectAccountId != null)
            .ToListAsync(cancellationToken);

        var nearby = goalkeepers
            .Select(g => new
            {
                Profile = g,
                Distance = CalculateDistance(query.Latitude, query.Longitude, g.Latitude, g.Longitude)
            })
            .Where(x => x.Distance <= query.RadiusKm)
            .OrderByDescending(x => x.Profile.Rating)
            .ThenBy(x => x.Distance)
            .ToList();

        var totalCount = nearby.Count;
        var items = nearby
            .Skip((query.Page - 1) * query.PageSize)
            .Take(query.PageSize)
            .Select(x => new GoalkeeperProfileDto(
                x.Profile.Id, x.Profile.UserId,
                $"{x.Profile.User.FirstName} {x.Profile.User.LastName}",
                x.Profile.User.ProfilePhotoUrl,
                x.Profile.PricePerMatch, x.Profile.ExperienceYears, x.Profile.Bio, x.Profile.City,
                x.Profile.Latitude, x.Profile.Longitude, x.Profile.MaxTravelDistanceKm,
                x.Profile.Rating, x.Profile.TotalMatches, x.Profile.TotalReviews,
                x.Profile.IsAvailable, Math.Round(x.Distance, 1)))
            .ToList();

        return Result<PagedResult<GoalkeeperProfileDto>>.Success(new PagedResult<GoalkeeperProfileDto>
        {
            Items = items,
            TotalCount = totalCount,
            Page = query.Page,
            PageSize = query.PageSize
        });
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
