namespace GoalieFinder.Application.DTOs;

public record CreateMatchRequest(
    string FieldName,
    string FieldAddress,
    double FieldLatitude,
    double FieldLongitude,
    DateTime MatchDateTime,
    int DurationMinutes,
    decimal PaymentAmount,
    string? Notes
);

public record MatchDto(
    Guid Id,
    Guid TeamProfileId,
    string TeamName,
    double TeamRating,
    string FieldName,
    string FieldAddress,
    double FieldLatitude,
    double FieldLongitude,
    DateTime MatchDateTime,
    int DurationMinutes,
    decimal PaymentAmount,
    decimal PlatformFee,
    decimal TotalAmount,
    string? Notes,
    string Status,
    Guid? AcceptedGoalkeeperId,
    string? AcceptedGoalkeeperName,
    double? DistanceKm,
    DateTime CreatedAt
);

public record NearbyMatchQuery(
    double Latitude,
    double Longitude,
    double RadiusKm = 15,
    int Page = 1,
    int PageSize = 20
);
