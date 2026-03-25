namespace GoalieFinder.Application.DTOs;

public record GoalkeeperProfileDto(
    Guid Id,
    Guid UserId,
    string FullName,
    string? ProfilePhotoUrl,
    decimal PricePerMatch,
    int ExperienceYears,
    string? Bio,
    double Latitude,
    double Longitude,
    int MaxTravelDistanceKm,
    double Rating,
    int TotalMatches,
    int TotalReviews,
    bool IsAvailable,
    double? DistanceKm
);

public record UpdateGoalkeeperProfileRequest(
    decimal PricePerMatch,
    int ExperienceYears,
    string? Bio,
    double Latitude,
    double Longitude,
    int MaxTravelDistanceKm,
    bool IsAvailable
);

public record GoalkeeperAvailabilityDto(
    Guid Id,
    DayOfWeek DayOfWeek,
    TimeOnly StartTime,
    TimeOnly EndTime,
    bool IsRecurring,
    DateOnly? SpecificDate
);

public record SetAvailabilityRequest(
    DayOfWeek DayOfWeek,
    string StartTime,
    string EndTime,
    bool IsRecurring,
    string? SpecificDate
);

public record NearbyGoalkeeperQuery(
    double Latitude,
    double Longitude,
    double RadiusKm = 15,
    int Page = 1,
    int PageSize = 20
);
