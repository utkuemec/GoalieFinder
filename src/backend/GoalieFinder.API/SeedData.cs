using GoalieFinder.Domain.Entities;
using GoalieFinder.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.API;

public static class SeedData
{
    public static async Task Initialize(ApplicationDbContext db)
    {
        if (await db.Users.AnyAsync())
            return;

        // Goalkeepers
        var gk1 = new User
        {
            Email = "marcus@example.com",
            PasswordHash = BCrypt.Net.BCrypt.HashPassword("password123"),
            FirstName = "Marcus",
            LastName = "Silva",
            PhoneNumber = "+14165551001",
            Role = UserRole.Goalkeeper,
            IsVerified = true,
            IsActive = true
        };
        var gk2 = new User
        {
            Email = "david@example.com",
            PasswordHash = BCrypt.Net.BCrypt.HashPassword("password123"),
            FirstName = "David",
            LastName = "Chen",
            PhoneNumber = "+14165551002",
            Role = UserRole.Goalkeeper,
            IsVerified = true,
            IsActive = true
        };
        var gk3 = new User
        {
            Email = "ahmed@example.com",
            PasswordHash = BCrypt.Net.BCrypt.HashPassword("password123"),
            FirstName = "Ahmed",
            LastName = "Hassan",
            PhoneNumber = "+14165551003",
            Role = UserRole.Goalkeeper,
            IsVerified = true,
            IsActive = true
        };
        var gk4 = new User
        {
            Email = "roberto@example.com",
            PasswordHash = BCrypt.Net.BCrypt.HashPassword("password123"),
            FirstName = "Roberto",
            LastName = "Diaz",
            PhoneNumber = "+14165551004",
            Role = UserRole.Goalkeeper,
            IsVerified = true,
            IsActive = true
        };

        db.Users.AddRange(gk1, gk2, gk3, gk4);

        var gkProfile1 = new GoalkeeperProfile
        {
            UserId = gk1.Id, PricePerMatch = 60, ExperienceYears = 8,
            Bio = "Former semi-pro goalkeeper with 8 years experience. Reliable and punctual.",
            Latitude = 43.6532, Longitude = -79.3832, MaxTravelDistanceKm = 15,
            Rating = 4.8, TotalMatches = 124, TotalReviews = 98, IsAvailable = true
        };
        var gkProfile2 = new GoalkeeperProfile
        {
            UserId = gk2.Id, PricePerMatch = 45, ExperienceYears = 5,
            Bio = "University soccer team goalkeeper. Available weekends and evenings.",
            Latitude = 43.7615, Longitude = -79.4110, MaxTravelDistanceKm = 20,
            Rating = 4.6, TotalMatches = 67, TotalReviews = 52, IsAvailable = true
        };
        var gkProfile3 = new GoalkeeperProfile
        {
            UserId = gk3.Id, PricePerMatch = 55, ExperienceYears = 12,
            Bio = "Veteran goalkeeper. 12+ years on the pitch. Cool under pressure.",
            Latitude = 43.6945, Longitude = -79.2675, MaxTravelDistanceKm = 10,
            Rating = 4.9, TotalMatches = 230, TotalReviews = 180, IsAvailable = true
        };
        var gkProfile4 = new GoalkeeperProfile
        {
            UserId = gk4.Id, PricePerMatch = 70, ExperienceYears = 15,
            Bio = "Professional goalkeeper coach. Top-tier performance guaranteed.",
            Latitude = 43.7515, Longitude = -79.4702, MaxTravelDistanceKm = 25,
            Rating = 5.0, TotalMatches = 312, TotalReviews = 278, IsAvailable = true
        };

        db.GoalkeeperProfiles.AddRange(gkProfile1, gkProfile2, gkProfile3, gkProfile4);

        // Team Captains
        var captain1 = new User
        {
            Email = "john@example.com",
            PasswordHash = BCrypt.Net.BCrypt.HashPassword("password123"),
            FirstName = "John",
            LastName = "Smith",
            PhoneNumber = "+14165552001",
            Role = UserRole.TeamCaptain,
            IsVerified = true,
            IsActive = true
        };
        var captain2 = new User
        {
            Email = "mike@example.com",
            PasswordHash = BCrypt.Net.BCrypt.HashPassword("password123"),
            FirstName = "Mike",
            LastName = "Johnson",
            PhoneNumber = "+14165552002",
            Role = UserRole.TeamCaptain,
            IsVerified = true,
            IsActive = true
        };

        db.Users.AddRange(captain1, captain2);

        var team1 = new TeamProfile
        {
            UserId = captain1.Id, TeamName = "Scarborough FC",
            Description = "Competitive indoor team", Rating = 4.2, TotalMatches = 45, TotalReviews = 38
        };
        var team2 = new TeamProfile
        {
            UserId = captain2.Id, TeamName = "North York United",
            Description = "Weekend recreational team", Rating = 4.7, TotalMatches = 28, TotalReviews = 22
        };

        db.TeamProfiles.AddRange(team1, team2);

        // Open matches
        db.Matches.AddRange(
            new Match
            {
                TeamProfileId = team1.Id, FieldName = "Birchmount Stadium",
                FieldAddress = "93 Birchmount Rd, Scarborough, ON",
                FieldLatitude = 43.6945, FieldLongitude = -79.2675,
                MatchDateTime = DateTime.UtcNow.AddHours(26),
                DurationMinutes = 60, PaymentAmount = 50, PlatformFee = 5, TotalAmount = 55,
                Notes = "Outdoor 7v7, competitive level", Status = MatchStatus.Open
            },
            new Match
            {
                TeamProfileId = team2.Id, FieldName = "Downsview Park",
                FieldAddress = "35 Carl Hall Rd, Toronto, ON",
                FieldLatitude = 43.7515, FieldLongitude = -79.4702,
                MatchDateTime = DateTime.UtcNow.AddDays(2),
                DurationMinutes = 90, PaymentAmount = 70, PlatformFee = 7, TotalAmount = 77,
                Status = MatchStatus.Open
            },
            new Match
            {
                TeamProfileId = team1.Id, FieldName = "Lamport Stadium",
                FieldAddress = "1155 King St W, Toronto, ON",
                FieldLatitude = 43.6383, FieldLongitude = -79.4213,
                MatchDateTime = DateTime.UtcNow.AddDays(4),
                DurationMinutes = 60, PaymentAmount = 55, PlatformFee = 5.5m, TotalAmount = 60.5m,
                Notes = "Indoor 5v5, bring dark jersey", Status = MatchStatus.Open
            }
        );

        await db.SaveChangesAsync();
    }
}
