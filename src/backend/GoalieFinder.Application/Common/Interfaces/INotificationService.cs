namespace GoalieFinder.Application.Common.Interfaces;

public interface INotificationService
{
    Task SendPushNotificationAsync(Guid userId, string title, string message, Dictionary<string, string>? data = null);
    Task SendEmailAsync(string to, string subject, string htmlBody);
}
