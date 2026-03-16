using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.Common.Models;
using GoalieFinder.Application.DTOs;
using GoalieFinder.Domain.Entities;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.Application.Features.Matches;

public record CreateMatchCommand(CreateMatchRequest Request, Guid UserId) : IRequest<Result<MatchDto>>;

public class CreateMatchCommandHandler : IRequestHandler<CreateMatchCommand, Result<MatchDto>>
{
    private readonly IApplicationDbContext _context;
    private readonly INotificationService _notificationService;
    private const decimal PlatformFeeRate = 0.10m;

    public CreateMatchCommandHandler(IApplicationDbContext context, INotificationService notificationService)
    {
        _context = context;
        _notificationService = notificationService;
    }

    public async Task<Result<MatchDto>> Handle(CreateMatchCommand command, CancellationToken cancellationToken)
    {
        var teamProfile = await _context.TeamProfiles
            .Include(t => t.User)
            .FirstOrDefaultAsync(t => t.UserId == command.UserId, cancellationToken);

        if (teamProfile == null)
            return Result<MatchDto>.Failure("Team profile not found");

        var request = command.Request;
        var platformFee = request.PaymentAmount * PlatformFeeRate;

        var match = new Match
        {
            TeamProfileId = teamProfile.Id,
            FieldName = request.FieldName,
            FieldAddress = request.FieldAddress,
            FieldLatitude = request.FieldLatitude,
            FieldLongitude = request.FieldLongitude,
            MatchDateTime = request.MatchDateTime,
            DurationMinutes = request.DurationMinutes,
            PaymentAmount = request.PaymentAmount,
            PlatformFee = platformFee,
            TotalAmount = request.PaymentAmount + platformFee,
            Notes = request.Notes,
            Status = MatchStatus.Open
        };

        _context.Matches.Add(match);
        await _context.SaveChangesAsync(cancellationToken);

        var nearbyGoalkeepers = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .Where(g => g.IsAvailable)
            .ToListAsync(cancellationToken);

        foreach (var gk in nearbyGoalkeepers)
        {
            var distance = CalculateDistance(match.FieldLatitude, match.FieldLongitude, gk.Latitude, gk.Longitude);
            if (distance <= gk.MaxTravelDistanceKm)
            {
                var notification = new Notification
                {
                    UserId = gk.UserId,
                    Title = "New Match Available!",
                    Message = $"{teamProfile.TeamName} needs a goalkeeper at {match.FieldName}",
                    Type = NotificationType.MatchRequest,
                    Data = System.Text.Json.JsonSerializer.Serialize(new { matchId = match.Id })
                };
                _context.Notifications.Add(notification);

                _ = _notificationService.SendPushNotificationAsync(gk.UserId, notification.Title, notification.Message);
            }
        }

        await _context.SaveChangesAsync(cancellationToken);

        var dto = new MatchDto(
            match.Id, teamProfile.Id, teamProfile.TeamName, teamProfile.Rating,
            match.FieldName, match.FieldAddress, match.FieldLatitude, match.FieldLongitude,
            match.MatchDateTime, match.DurationMinutes, match.PaymentAmount, match.PlatformFee,
            match.TotalAmount, match.Notes, match.Status.ToString(), null, null, null, match.CreatedAt);

        return Result<MatchDto>.Created(dto);
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
