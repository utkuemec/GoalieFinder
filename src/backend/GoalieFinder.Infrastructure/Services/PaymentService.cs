using GoalieFinder.Application.Common.Interfaces;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Stripe;

namespace GoalieFinder.Infrastructure.Services;

public class PaymentService : IPaymentService
{
    private readonly ILogger<PaymentService> _logger;

    public PaymentService(ILogger<PaymentService> logger, IConfiguration configuration)
    {
        _logger = logger;
        StripeConfiguration.ApiKey = configuration["Stripe:SecretKey"];
    }

    public async Task<string> CreatePaymentIntentAsync(decimal amount, string currency, string customerId, Dictionary<string, string> metadata)
    {
        var service = new PaymentIntentService();
        var options = new PaymentIntentCreateOptions
        {
            Amount = (long)(amount * 100),
            Currency = currency,
            Customer = !string.IsNullOrEmpty(customerId) ? customerId : null,
            Metadata = metadata,
            AutomaticPaymentMethods = new PaymentIntentAutomaticPaymentMethodsOptions
            {
                Enabled = true,
            },
        };

        var intent = await service.CreateAsync(options);
        _logger.LogInformation("Payment intent created: {Id} for {Amount} {Currency}", intent.Id, amount, currency);
        return intent.ClientSecret;
    }

    public async Task<string> CapturePaymentAsync(string paymentIntentId)
    {
        var service = new PaymentIntentService();
        var intent = await service.CaptureAsync(paymentIntentId);
        _logger.LogInformation("Payment captured: {Id}", intent.Id);
        return intent.Id;
    }

    public async Task<string> CreateTransferAsync(decimal amount, string connectedAccountId, string paymentIntentId)
    {
        var service = new TransferService();
        var options = new TransferCreateOptions
        {
            Amount = (long)(amount * 100),
            Currency = "cad",
            Destination = connectedAccountId,
            TransferGroup = paymentIntentId,
        };

        var transfer = await service.CreateAsync(options);
        _logger.LogInformation("Transfer created: {Id} to {Account}", transfer.Id, connectedAccountId);
        return transfer.Id;
    }

    public async Task<string> CreateConnectAccountAsync(string email)
    {
        var service = new AccountService();
        var options = new AccountCreateOptions
        {
            Type = "express",
            Email = email,
            Country = "CA",
            Capabilities = new AccountCapabilitiesOptions
            {
                CardPayments = new AccountCapabilitiesCardPaymentsOptions { Requested = true },
                Transfers = new AccountCapabilitiesTransfersOptions { Requested = true },
            },
        };

        var account = await service.CreateAsync(options);
        _logger.LogInformation("Connect account created: {Id} for {Email}", account.Id, email);
        return account.Id;
    }
}
