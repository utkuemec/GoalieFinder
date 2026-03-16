using GoalieFinder.Application.Common.Interfaces;
using Microsoft.Extensions.Logging;

namespace GoalieFinder.Infrastructure.Services;

public class NotificationService : INotificationService
{
    private readonly ILogger<NotificationService> _logger;

    public NotificationService(ILogger<NotificationService> logger)
    {
        _logger = logger;
    }

    public Task SendPushNotificationAsync(Guid userId, string title, string message, Dictionary<string, string>? data = null)
    {
        _logger.LogInformation("Push notification sent to {UserId}: {Title}", userId, title);
        return Task.CompletedTask;
    }

    public Task SendEmailAsync(string to, string subject, string htmlBody)
    {
        _logger.LogInformation("Email sent to {To}: {Subject}", to, subject);
        return Task.CompletedTask;
    }
}
