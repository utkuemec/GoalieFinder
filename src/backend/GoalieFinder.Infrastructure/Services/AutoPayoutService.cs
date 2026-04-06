using GoalieFinder.Domain.Entities;
using GoalieFinder.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Stripe;

namespace GoalieFinder.Infrastructure.Services;

public class AutoPayoutService : BackgroundService
{
    private readonly IServiceScopeFactory _scopeFactory;
    private readonly ILogger<AutoPayoutService> _logger;
    private readonly TimeSpan _checkInterval = TimeSpan.FromMinutes(15);
    private readonly TimeSpan _autoConfirmAfter = TimeSpan.FromHours(24);

    public AutoPayoutService(IServiceScopeFactory scopeFactory, ILogger<AutoPayoutService> logger)
    {
        _scopeFactory = scopeFactory;
        _logger = logger;
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        _logger.LogInformation("AutoPayoutService started");

        while (!stoppingToken.IsCancellationRequested)
        {
            try
            {
                await ProcessExpiredMatches(stoppingToken);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error in AutoPayoutService");
            }

            await Task.Delay(_checkInterval, stoppingToken);
        }
    }

    private async Task ProcessExpiredMatches(CancellationToken ct)
    {
        using var scope = _scopeFactory.CreateScope();
        var context = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
        var config = scope.ServiceProvider.GetRequiredService<IConfiguration>();
        var emailService = scope.ServiceProvider.GetRequiredService<IBookingEmailService>();

        StripeConfiguration.ApiKey = config["Stripe:SecretKey"];

        var cutoff = DateTime.UtcNow - _autoConfirmAfter;

        var expiredMatches = await context.Matches
            .Include(m => m.Payment)
            .Where(m => m.Status == MatchStatus.Accepted && m.MatchDateTime < cutoff)
            .ToListAsync(ct);

        if (expiredMatches.Count == 0) return;

        var confirmed = 0;
        foreach (var match in expiredMatches)
        {
            var payment = await context.Payments.FirstOrDefaultAsync(p => p.MatchId == match.Id, ct);
            var gkProfile = await context.GoalkeeperProfiles
                .Include(g => g.User)
                .FirstOrDefaultAsync(g => g.Id == match.AcceptedGoalkeeperId, ct);

            if (payment != null && gkProfile != null && !string.IsNullOrEmpty(gkProfile.User.StripeConnectAccountId))
            {
                try
                {
                    var chargeId = payment.StripeChargeId;
                    if (string.IsNullOrEmpty(chargeId))
                    {
                        var piService = new PaymentIntentService();
                        var pi = await piService.GetAsync(payment.StripePaymentIntentId);
                        chargeId = pi.LatestChargeId;
                        payment.StripeChargeId = chargeId;
                    }

                    var transferOpts = new TransferCreateOptions
                    {
                        Amount = (long)(match.PaymentAmount * 100),
                        Currency = "cad",
                        Destination = gkProfile.User.StripeConnectAccountId,
                        TransferGroup = payment.StripePaymentIntentId,
                        Description = $"Payout for match at {match.FieldName} on {match.MatchDateTime:MMM dd}",
                    };
                    if (!string.IsNullOrEmpty(chargeId))
                        transferOpts.SourceTransaction = chargeId;

                    var transferService = new TransferService();
                    var transfer = await transferService.CreateAsync(transferOpts);
                    payment.StripeTransferId = transfer.Id;
                    payment.Status = PaymentStatus.Released;
                    payment.CompletedAt = DateTime.UtcNow;

                    try
                    {
                        await emailService.SendPaymentReleasedEmail(
                            gkProfile.User.Email,
                            $"{gkProfile.User.FirstName} {gkProfile.User.LastName}",
                            match.FieldName,
                            match.MatchDateTime,
                            match.PaymentAmount);
                    }
                    catch (Exception emailEx)
                    {
                        _logger.LogError(emailEx, "Failed to send payment email for match {MatchId}", match.Id);
                    }
                }
                catch (StripeException ex)
                {
                    _logger.LogError(ex, "Transfer failed for match {MatchId}", match.Id);
                    continue;
                }
            }

            match.Status = MatchStatus.Completed;
            match.UpdatedAt = DateTime.UtcNow;
            if (gkProfile != null) gkProfile.TotalMatches++;
            confirmed++;
        }

        if (confirmed > 0)
        {
            await context.SaveChangesAsync(ct);
            _logger.LogInformation("Auto-confirmed and paid out {Count} matches", confirmed);
        }
    }
}
