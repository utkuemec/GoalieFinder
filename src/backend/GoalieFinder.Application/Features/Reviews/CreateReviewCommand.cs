using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.Common.Models;
using GoalieFinder.Application.DTOs;
using GoalieFinder.Domain.Entities;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.Application.Features.Reviews;

public record CreateReviewCommand(CreateReviewRequest Request, Guid ReviewerId) : IRequest<Result<ReviewDto>>;

public class CreateReviewCommandHandler : IRequestHandler<CreateReviewCommand, Result<ReviewDto>>
{
    private readonly IApplicationDbContext _context;

    public CreateReviewCommandHandler(IApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<Result<ReviewDto>> Handle(CreateReviewCommand command, CancellationToken cancellationToken)
    {
        var request = command.Request;

        var match = await _context.Matches
            .FirstOrDefaultAsync(m => m.Id == request.MatchId, cancellationToken);

        if (match == null)
            return Result<ReviewDto>.NotFound("Match not found");

        if (match.Status != MatchStatus.Completed)
            return Result<ReviewDto>.Failure("Can only review completed matches");

        var existingReview = await _context.Reviews
            .AnyAsync(r => r.MatchId == request.MatchId && r.ReviewerId == command.ReviewerId, cancellationToken);

        if (existingReview)
            return Result<ReviewDto>.Failure("You have already reviewed this match");

        var reviewer = await _context.Users.FindAsync(new object[] { command.ReviewerId }, cancellationToken);

        var review = new Review
        {
            MatchId = request.MatchId,
            ReviewerId = command.ReviewerId,
            RevieweeId = request.RevieweeId,
            Rating = Math.Clamp(request.Rating, 1, 5),
            Comment = request.Comment
        };

        _context.Reviews.Add(review);

        var reviewee = await _context.Users.FindAsync(new object[] { request.RevieweeId }, cancellationToken);
        if (reviewee?.Role == UserRole.Goalkeeper)
        {
            var gkProfile = await _context.GoalkeeperProfiles
                .FirstOrDefaultAsync(g => g.UserId == request.RevieweeId, cancellationToken);
            if (gkProfile != null)
            {
                gkProfile.TotalReviews++;
                gkProfile.Rating = ((gkProfile.Rating * (gkProfile.TotalReviews - 1)) + review.Rating) / gkProfile.TotalReviews;
            }
        }
        else if (reviewee?.Role == UserRole.TeamCaptain)
        {
            var teamProfile = await _context.TeamProfiles
                .FirstOrDefaultAsync(t => t.UserId == request.RevieweeId, cancellationToken);
            if (teamProfile != null)
            {
                teamProfile.TotalReviews++;
                teamProfile.Rating = ((teamProfile.Rating * (teamProfile.TotalReviews - 1)) + review.Rating) / teamProfile.TotalReviews;
            }
        }

        await _context.SaveChangesAsync(cancellationToken);

        var dto = new ReviewDto(
            review.Id, review.MatchId,
            $"{reviewer?.FirstName} {reviewer?.LastName}",
            reviewer?.ProfilePhotoUrl,
            review.Rating, review.Comment, review.CreatedAt);

        return Result<ReviewDto>.Created(dto);
    }
}
