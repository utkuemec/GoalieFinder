using GoalieFinder.Domain.Entities;
using GoalieFinder.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Stripe;

namespace GoalieFinder.Infrastructure.Services;

public class BotAutoDeclineService : BackgroundService
{
    private readonly IServiceScopeFactory _scopeFactory;
    private readonly ILogger<BotAutoDeclineService> _logger;
    private readonly TimeSpan _checkInterval = TimeSpan.FromMinutes(5);
    private readonly TimeSpan _declineAfter = TimeSpan.FromHours(1);

    public BotAutoDeclineService(IServiceScopeFactory scopeFactory, ILogger<BotAutoDeclineService> logger)
    {
        _scopeFactory = scopeFactory;
        _logger = logger;
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        _logger.LogInformation("BotAutoDeclineService started");

        while (!stoppingToken.IsCancellationRequested)
        {
            try
            {
                await ProcessBotBookings(stoppingToken);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error processing bot auto-decline");
            }

            await Task.Delay(_checkInterval, stoppingToken);
        }
    }

    private async Task ProcessBotBookings(CancellationToken ct)
    {
        using var scope = _scopeFactory.CreateScope();
        var context = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
        var config = scope.ServiceProvider.GetRequiredService<IConfiguration>();
        var emailService = scope.ServiceProvider.GetRequiredService<IBookingEmailService>();

        StripeConfiguration.ApiKey = config["Stripe:SecretKey"];

        var cutoff = DateTime.UtcNow - _declineAfter;

        var botBookings = await context.Matches
            .Include(m => m.TeamProfile).ThenInclude(t => t.User)
            .Include(m => m.Payment)
            .Where(m => m.Status == MatchStatus.Open
                && m.CreatedAt < cutoff
                && m.AcceptedGoalkeeperId != null)
            .ToListAsync(ct);

        var declined = 0;
        foreach (var match in botBookings)
        {
            if (match.AcceptedGoalkeeperId == null) continue;

            var gkProfile = await context.GoalkeeperProfiles
                .Include(g => g.User)
                .FirstOrDefaultAsync(g => g.Id == match.AcceptedGoalkeeperId, ct);

            if (gkProfile == null) continue;
            if (!gkProfile.User.Email.EndsWith("@bot.goaliefinder.local")) continue;

            var payment = await context.Payments.FirstOrDefaultAsync(p => p.MatchId == match.Id, ct);
            if (payment != null)
            {
                try
                {
                    if (payment.Status == PaymentStatus.Authorized)
                    {
                        var piService = new PaymentIntentService();
                        await piService.CancelAsync(payment.StripePaymentIntentId, cancellationToken: ct);
                    }
                    payment.Status = PaymentStatus.Refunded;
                }
                catch (StripeException ex)
                {
                    _logger.LogWarning(ex, "Failed to cancel payment for bot booking {MatchId}", match.Id);
                }
            }

            match.Status = MatchStatus.Cancelled;
            match.Notes = (match.Notes ?? "") + "\n[BOT_AUTO_DECLINED]";
            match.UpdatedAt = DateTime.UtcNow;
            declined++;

            var captainEmail = match.TeamProfile?.User?.Email;
            var captainName = match.TeamProfile?.User != null
                ? $"{match.TeamProfile.User.FirstName} {match.TeamProfile.User.LastName}"
                : "Captain";
            var gkName = $"{gkProfile.User.FirstName} {gkProfile.User.LastName}";

            if (!string.IsNullOrEmpty(captainEmail))
            {
                try
                {
                    await emailService.SendBookingDeclinedEmail(
                        captainEmail: captainEmail,
                        captainName: captainName,
                        goalkeeperName: gkName,
                        fieldName: match.FieldName,
                        matchDateTime: match.MatchDateTime);
                }
                catch (Exception ex)
                {
                    _logger.LogWarning(ex, "Failed to send decline email for bot booking {MatchId}", match.Id);
                }
            }
        }

        if (declined > 0)
        {
            await context.SaveChangesAsync(ct);
            _logger.LogInformation("Auto-declined {Count} bot bookings", declined);
        }
    }
}
