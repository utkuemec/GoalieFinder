namespace GoalieFinder.Application.DTOs;

public record CreatePaymentIntentRequest(Guid MatchId);

public record PaymentIntentResponse(
    string ClientSecret,
    string PaymentIntentId,
    decimal Amount
);
