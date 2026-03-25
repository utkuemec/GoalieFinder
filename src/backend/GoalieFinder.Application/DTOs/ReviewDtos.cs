namespace GoalieFinder.Application.DTOs;

public record CreateReviewRequest(
    Guid MatchId,
    Guid RevieweeId,
    int Rating,
    string? Comment
);

public record ReviewDto(
    Guid Id,
    Guid MatchId,
    string ReviewerName,
    string? ReviewerPhotoUrl,
    int Rating,
    string? Comment,
    DateTime CreatedAt
);
