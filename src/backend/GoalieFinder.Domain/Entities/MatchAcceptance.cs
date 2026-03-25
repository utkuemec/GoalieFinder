namespace GoalieFinder.Domain.Entities;

public class MatchAcceptance
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public Guid MatchId { get; set; }
    public Match Match { get; set; } = null!;
    public Guid GoalkeeperProfileId { get; set; }
    public GoalkeeperProfile GoalkeeperProfile { get; set; } = null!;
    public AcceptanceStatus Status { get; set; } = AcceptanceStatus.Pending;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
