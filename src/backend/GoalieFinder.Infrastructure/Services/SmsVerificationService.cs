using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Collections.Concurrent;
using System.Net;
using System.Net.Mail;

namespace GoalieFinder.Infrastructure.Services;

public interface IVerificationService
{
    Task<(bool Success, string? Code)> SendVerificationCodeAsync(string email);
    bool VerifyCode(string email, string code);
}

public class EmailVerificationService : IVerificationService
{
    private readonly ILogger<EmailVerificationService> _logger;
    private readonly IConfiguration _configuration;
    private readonly ConcurrentDictionary<string, (string Code, DateTime ExpiresAt)> _codes = new();

    public EmailVerificationService(ILogger<EmailVerificationService> logger, IConfiguration configuration)
    {
        _logger = logger;
        _configuration = configuration;
    }

    public async Task<(bool Success, string? Code)> SendVerificationCodeAsync(string email)
    {
        var normalized = email.Trim().ToLowerInvariant();
        var code = Random.Shared.Next(100000, 999999).ToString();

        _codes[normalized] = (code, DateTime.UtcNow.AddMinutes(10));

        var smtpHost = _configuration["Email:SmtpHost"];
        var smtpUser = _configuration["Email:SmtpUser"];
        var smtpPass = _configuration["Email:SmtpPassword"];

        if (string.IsNullOrEmpty(smtpHost) || string.IsNullOrEmpty(smtpUser))
        {
            _logger.LogWarning("Email SMTP not configured — code generated for {Email} (check server logs in dev only)", normalized);
            return (true, code);
        }

        try
        {
            var smtpPort = int.Parse(_configuration["Email:SmtpPort"] ?? "587");
            var fromName = _configuration["Email:FromName"] ?? "GoalieFinder Toronto";

            using var client = new SmtpClient(smtpHost, smtpPort)
            {
                Credentials = new NetworkCredential(smtpUser, smtpPass),
                EnableSsl = true
            };

            var message = new MailMessage
            {
                From = new MailAddress(smtpUser, fromName),
                Subject = $"GoalieFinder — Your verification code is {code}",
                IsBodyHtml = true,
                Body = $@"
                    <div style='font-family:Arial,sans-serif;max-width:480px;margin:0 auto;padding:32px'>
                        <div style='text-align:center;margin-bottom:24px'>
                            <div style='display:inline-block;background:#059669;color:white;font-size:24px;font-weight:bold;width:48px;height:48px;line-height:48px;border-radius:12px'>G</div>
                        </div>
                        <h2 style='text-align:center;color:#1e293b;margin-bottom:8px'>Verify your email</h2>
                        <p style='text-align:center;color:#64748b;margin-bottom:24px'>Enter this code to complete your GoalieFinder registration:</p>
                        <div style='text-align:center;background:#f1f5f9;border-radius:12px;padding:24px;margin-bottom:24px'>
                            <span style='font-size:36px;font-weight:bold;letter-spacing:8px;color:#059669'>{code}</span>
                        </div>
                        <p style='text-align:center;color:#94a3b8;font-size:14px'>This code expires in 10 minutes.</p>
                    </div>"
            };
            message.To.Add(normalized);

            await client.SendMailAsync(message);
            _logger.LogInformation("Verification email sent to {Email}", normalized);
            return (true, null);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to send verification email to {Email}", normalized);
            return (true, code);
        }
    }

    public bool VerifyCode(string email, string code)
    {
        var normalized = email.Trim().ToLowerInvariant();

        if (!_codes.TryGetValue(normalized, out var stored))
            return false;

        if (DateTime.UtcNow > stored.ExpiresAt)
        {
            _codes.TryRemove(normalized, out _);
            return false;
        }

        if (stored.Code != code)
            return false;

        _codes.TryRemove(normalized, out _);
        return true;
    }
}
