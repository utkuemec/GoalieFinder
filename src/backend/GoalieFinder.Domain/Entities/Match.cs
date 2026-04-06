namespace GoalieFinder.Domain.Entities;

public class Match
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public Guid TeamProfileId { get; set; }
    public TeamProfile TeamProfile { get; set; } = null!;
    public string FieldName { get; set; } = string.Empty;
    public string FieldAddress { get; set; } = string.Empty;
    public double FieldLatitude { get; set; }
    public double FieldLongitude { get; set; }
    public DateTime MatchDateTime { get; set; }
    public int DurationMinutes { get; set; } = 60;
    public decimal PaymentAmount { get; set; }
    public decimal PlatformFee { get; set; }
    public decimal TaxRate { get; set; }
    public decimal TaxAmount { get; set; }
    public decimal StripeFee { get; set; }
    public decimal TotalAmount { get; set; }
    public string? Notes { get; set; }
    public MatchStatus Status { get; set; } = MatchStatus.Open;
    public Guid? AcceptedGoalkeeperId { get; set; }
    public GoalkeeperProfile? AcceptedGoalkeeper { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public ICollection<MatchAcceptance> Acceptances { get; set; } = new List<MatchAcceptance>();
    public Payment? Payment { get; set; }
    public ICollection<Review> Reviews { get; set; } = new List<Review>();
}
