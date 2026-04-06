namespace GoalieFinder.Domain.Entities;

public class GoalkeeperProfile
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public Guid UserId { get; set; }
    public User User { get; set; } = null!;
    public decimal PricePerMatch { get; set; }
    public int ExperienceYears { get; set; }
    public string? Bio { get; set; }
    public string? City { get; set; }
    public double Latitude { get; set; }
    public double Longitude { get; set; }
    public int MaxTravelDistanceKm { get; set; } = 15;
    public double Rating { get; set; }
    public int TotalMatches { get; set; }
    public int TotalReviews { get; set; }
    public bool IsAvailable { get; set; } = true;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public ICollection<GoalkeeperAvailability> Availabilities { get; set; } = new List<GoalkeeperAvailability>();
    public ICollection<MatchAcceptance> MatchAcceptances { get; set; } = new List<MatchAcceptance>();
    public ICollection<Match> AcceptedMatches { get; set; } = new List<Match>();
}
