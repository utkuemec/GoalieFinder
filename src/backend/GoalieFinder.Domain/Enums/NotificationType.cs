namespace GoalieFinder.Domain.Entities;

public enum NotificationType
{
    MatchRequest = 0,
    MatchAccepted = 1,
    MatchCancelled = 2,
    PaymentReceived = 3,
    ReviewReceived = 4,
    SystemAlert = 5
}
