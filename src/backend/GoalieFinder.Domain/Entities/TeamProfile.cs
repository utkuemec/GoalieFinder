namespace GoalieFinder.Domain.Entities;

public class TeamProfile
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public Guid UserId { get; set; }
    public User User { get; set; } = null!;
    public string TeamName { get; set; } = string.Empty;
    public string? Description { get; set; }
    public double Rating { get; set; }
    public int TotalMatches { get; set; }
    public int TotalReviews { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public ICollection<Match> Matches { get; set; } = new List<Match>();
}
