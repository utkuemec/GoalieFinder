namespace GoalieFinder.Domain.Entities;

public class GoalkeeperAvailability
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public Guid GoalkeeperProfileId { get; set; }
    public GoalkeeperProfile GoalkeeperProfile { get; set; } = null!;
    public DayOfWeek DayOfWeek { get; set; }
    public TimeOnly StartTime { get; set; }
    public TimeOnly EndTime { get; set; }
    public bool IsRecurring { get; set; } = true;
    public DateOnly? SpecificDate { get; set; }
}
