namespace GoalieFinder.Application.Common.Interfaces;

public interface IPaymentService
{
    Task<string> CreatePaymentIntentAsync(decimal amount, string currency, string customerId, Dictionary<string, string> metadata);
    Task<string> CapturePaymentAsync(string paymentIntentId);
    Task<string> CreateTransferAsync(decimal amount, string connectedAccountId, string paymentIntentId);
    Task<string> CreateConnectAccountAsync(string email);
}
