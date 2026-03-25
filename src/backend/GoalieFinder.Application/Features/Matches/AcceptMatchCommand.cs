using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.Common.Models;
using GoalieFinder.Application.DTOs;
using GoalieFinder.Domain.Entities;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.Application.Features.Matches;

public record AcceptMatchCommand(Guid MatchId, Guid UserId) : IRequest<Result<MatchDto>>;

public class AcceptMatchCommandHandler : IRequestHandler<AcceptMatchCommand, Result<MatchDto>>
{
    private readonly IApplicationDbContext _context;
    private readonly INotificationService _notificationService;

    public AcceptMatchCommandHandler(IApplicationDbContext context, INotificationService notificationService)
    {
        _context = context;
        _notificationService = notificationService;
    }

    public async Task<Result<MatchDto>> Handle(AcceptMatchCommand command, CancellationToken cancellationToken)
    {
        var goalkeeperProfile = await _context.GoalkeeperProfiles
            .Include(g => g.User)
            .FirstOrDefaultAsync(g => g.UserId == command.UserId, cancellationToken);

        if (goalkeeperProfile == null)
            return Result<MatchDto>.Failure("Goalkeeper profile not found");

        var match = await _context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .FirstOrDefaultAsync(m => m.Id == command.MatchId, cancellationToken);

        if (match == null)
            return Result<MatchDto>.NotFound("Match not found");

        if (match.Status != MatchStatus.Open)
            return Result<MatchDto>.Failure("Match is no longer available");

        var acceptance = new MatchAcceptance
        {
            MatchId = match.Id,
            GoalkeeperProfileId = goalkeeperProfile.Id,
            Status = AcceptanceStatus.Accepted
        };

        match.Status = MatchStatus.Accepted;
        match.AcceptedGoalkeeperId = goalkeeperProfile.Id;

        _context.MatchAcceptances.Add(acceptance);

        var notification = new Notification
        {
            UserId = match.TeamProfile.UserId,
            Title = "Goalkeeper Found!",
            Message = $"{goalkeeperProfile.User.FirstName} accepted your match at {match.FieldName}",
            Type = NotificationType.MatchAccepted,
            Data = System.Text.Json.JsonSerializer.Serialize(new { matchId = match.Id })
        };
        _context.Notifications.Add(notification);

        await _context.SaveChangesAsync(cancellationToken);

        _ = _notificationService.SendPushNotificationAsync(
            match.TeamProfile.UserId, notification.Title, notification.Message);

        var dto = new MatchDto(
            match.Id, match.TeamProfileId, match.TeamProfile.TeamName, match.TeamProfile.Rating,
            match.FieldName, match.FieldAddress, match.FieldLatitude, match.FieldLongitude,
            match.MatchDateTime, match.DurationMinutes, match.PaymentAmount, match.PlatformFee,
            match.TotalAmount, match.Notes, match.Status.ToString(), match.AcceptedGoalkeeperId,
            $"{goalkeeperProfile.User.FirstName} {goalkeeperProfile.User.LastName}",
            null, match.CreatedAt);

        return Result<MatchDto>.Success(dto);
    }
}
