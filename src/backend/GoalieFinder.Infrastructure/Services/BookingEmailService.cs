using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Net;
using System.Net.Mail;

namespace GoalieFinder.Infrastructure.Services;

public interface IBookingEmailService
{
    Task SendBookingRequestEmail(
        string goalkeeperEmail,
        string goalkeeperName,
        string captainName,
        string captainPhone,
        string fieldName,
        string fieldAddress,
        DateTime matchDateTime,
        int durationMinutes,
        decimal goalkeeperFee,
        decimal serviceFee,
        decimal totalAmount,
        string? notes);

    Task SendBookingAcceptedEmail(
        string captainEmail,
        string captainName,
        string goalkeeperName,
        string goalkeeperPhone,
        string fieldName,
        DateTime matchDateTime,
        decimal totalCharged,
        string? confirmUrl = null,
        string? cancelUrl = null);

    Task SendBookingDeclinedEmail(
        string captainEmail,
        string captainName,
        string goalkeeperName,
        string fieldName,
        DateTime matchDateTime);

    Task SendGoalkeeperCancelledEmail(
        string captainEmail,
        string captainName,
        string goalkeeperName,
        string fieldName,
        DateTime matchDateTime);
}

public class BookingEmailService : IBookingEmailService
{
    private readonly ILogger<BookingEmailService> _logger;
    private readonly IConfiguration _configuration;

    public BookingEmailService(ILogger<BookingEmailService> logger, IConfiguration configuration)
    {
        _logger = logger;
        _configuration = configuration;
    }

    public async Task SendBookingRequestEmail(
        string goalkeeperEmail,
        string goalkeeperName,
        string captainName,
        string captainPhone,
        string fieldName,
        string fieldAddress,
        DateTime matchDateTime,
        int durationMinutes,
        decimal goalkeeperFee,
        decimal serviceFee,
        decimal totalAmount,
        string? notes)
    {
        var subject = $"New Booking Request from {captainName}!";
        var body = $@"
<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto;padding:0'>
  <div style='background:#059669;padding:24px;text-align:center;border-radius:12px 12px 0 0'>
    <h1 style='color:white;margin:0;font-size:24px'>New Booking Request!</h1>
  </div>
  <div style='background:white;padding:32px;border:1px solid #e2e8f0;border-top:none;border-radius:0 0 12px 12px'>
    <p style='font-size:16px;color:#1e293b'>Hey {goalkeeperName},</p>
    <p style='color:#64748b'>You have a new booking request! Here are the details:</p>

    <div style='background:#f8fafc;border-radius:8px;padding:20px;margin:20px 0'>
      <table style='width:100%;border-collapse:collapse'>
        <tr>
          <td style='padding:8px 0;color:#64748b;font-size:14px'>Booked by</td>
          <td style='padding:8px 0;color:#1e293b;font-weight:bold;text-align:right'>{captainName}</td>
        </tr>
        <tr>
          <td style='padding:8px 0;color:#64748b;font-size:14px'>Phone</td>
          <td style='padding:8px 0;color:#1e293b;font-weight:bold;text-align:right'>{captainPhone}</td>
        </tr>
        <tr>
          <td style='padding:8px 0;color:#64748b;font-size:14px;border-top:1px solid #e2e8f0'>Field</td>
          <td style='padding:8px 0;color:#1e293b;font-weight:bold;text-align:right;border-top:1px solid #e2e8f0'>{fieldName}</td>
        </tr>
        <tr>
          <td style='padding:8px 0;color:#64748b;font-size:14px'>Address</td>
          <td style='padding:8px 0;color:#1e293b;text-align:right;font-size:13px'>{fieldAddress}</td>
        </tr>
        <tr>
          <td style='padding:8px 0;color:#64748b;font-size:14px;border-top:1px solid #e2e8f0'>Date & Time</td>
          <td style='padding:8px 0;color:#1e293b;font-weight:bold;text-align:right;border-top:1px solid #e2e8f0'>{matchDateTime:dddd, MMMM dd, yyyy 'at' h:mm tt}</td>
        </tr>
        <tr>
          <td style='padding:8px 0;color:#64748b;font-size:14px'>Duration</td>
          <td style='padding:8px 0;color:#1e293b;font-weight:bold;text-align:right'>{durationMinutes} minutes</td>
        </tr>
        <tr>
          <td style='padding:12px 0 4px;color:#64748b;font-size:14px;border-top:2px solid #059669'>Your fee</td>
          <td style='padding:12px 0 4px;color:#059669;font-weight:bold;font-size:20px;text-align:right;border-top:2px solid #059669'>${goalkeeperFee:F2} CAD</td>
        </tr>
      </table>
    </div>

    {(string.IsNullOrEmpty(notes) ? "" : $@"
    <div style='background:#fefce8;border:1px solid #fde68a;border-radius:8px;padding:16px;margin:16px 0'>
      <p style='margin:0 0 4px;font-size:13px;color:#92400e;font-weight:bold'>Notes from {captainName}:</p>
      <p style='margin:0;color:#78350f;font-size:14px'>{notes}</p>
    </div>
    ")}

    <p style='color:#64748b;font-size:14px;margin-top:24px'>
      Log in to your GoalieFinder dashboard to <strong>accept</strong> or <strong>decline</strong> this booking.
    </p>

    <div style='text-align:center;margin:24px 0'>
      <a href='https://goaliefinders.com/dashboard/goalkeeper' style='display:inline-block;background:#059669;color:white;padding:14px 32px;border-radius:8px;text-decoration:none;font-weight:bold;font-size:16px'>
        View Booking Request
      </a>
    </div>

    <p style='color:#94a3b8;font-size:12px;text-align:center;margin-top:32px'>
      GoalieFinder Canada — Find your perfect keeper
    </p>
  </div>
</div>";

        await SendEmail(goalkeeperEmail, subject, body);
    }

    public async Task SendBookingAcceptedEmail(
        string captainEmail,
        string captainName,
        string goalkeeperName,
        string goalkeeperPhone,
        string fieldName,
        DateTime matchDateTime,
        decimal totalCharged,
        string? confirmUrl = null,
        string? cancelUrl = null)
    {
        var subject = $"Booking Confirmed! {goalkeeperName} accepted your request";
        var confirmSection = string.IsNullOrEmpty(confirmUrl) ? "" : $@"
    <div style='background:#eff6ff;border:1px solid #bfdbfe;border-radius:8px;padding:20px;margin:20px 0;text-align:center'>
      <p style='margin:0 0 8px;font-size:15px;font-weight:bold;color:#1e40af'>After the match, confirm it happened:</p>
      <p style='margin:0 0 16px;font-size:13px;color:#64748b'>This releases the payment to the goalkeeper. Auto-confirms after 24 hours.</p>
      <a href='{confirmUrl}' style='display:inline-block;background:#059669;color:white;padding:14px 32px;border-radius:8px;text-decoration:none;font-weight:bold;font-size:16px'>
        Confirm Match Completed
      </a>
    </div>";

        var cancelSection = string.IsNullOrEmpty(cancelUrl) ? "" : $@"
    <div style='background:#fef2f2;border:1px solid #fecaca;border-radius:8px;padding:16px;margin:20px 0;text-align:center'>
      <p style='margin:0 0 8px;font-size:13px;color:#991b1b;font-weight:bold'>Need to cancel?</p>
      <p style='margin:0 0 12px;font-size:12px;color:#64748b'>You can cancel once. A 50% refund will be issued.</p>
      <a href='{cancelUrl}' style='display:inline-block;background:#dc2626;color:white;padding:10px 24px;border-radius:6px;text-decoration:none;font-weight:bold;font-size:14px'>
        Cancel Booking
      </a>
    </div>";

        var body = $@"
<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto'>
  <div style='background:#059669;padding:24px;text-align:center;border-radius:12px 12px 0 0'>
    <h1 style='color:white;margin:0;font-size:24px'>Booking Confirmed!</h1>
  </div>
  <div style='background:white;padding:32px;border:1px solid #e2e8f0;border-top:none;border-radius:0 0 12px 12px'>
    <p style='font-size:16px;color:#1e293b'>Hey {captainName},</p>
    <p style='color:#64748b'><strong>{goalkeeperName}</strong> has accepted your booking request!</p>

    <div style='background:#f0fdf4;border:1px solid #bbf7d0;border-radius:8px;padding:20px;margin:20px 0'>
      <table style='width:100%;border-collapse:collapse'>
        <tr><td style='padding:6px 0;color:#64748b;font-size:14px'>Goalkeeper</td><td style='padding:6px 0;color:#1e293b;font-weight:bold;text-align:right'>{goalkeeperName}</td></tr>
        <tr><td style='padding:6px 0;color:#64748b;font-size:14px'>Phone</td><td style='padding:6px 0;color:#1e293b;font-weight:bold;text-align:right'>{goalkeeperPhone}</td></tr>
        <tr><td style='padding:6px 0;color:#64748b;font-size:14px'>Field</td><td style='padding:6px 0;color:#1e293b;font-weight:bold;text-align:right'>{fieldName}</td></tr>
        <tr><td style='padding:6px 0;color:#64748b;font-size:14px'>Date & Time</td><td style='padding:6px 0;color:#1e293b;font-weight:bold;text-align:right'>{matchDateTime:dddd, MMM dd 'at' h:mm tt}</td></tr>
        <tr><td style='padding:6px 0;color:#64748b;font-size:14px;border-top:1px solid #bbf7d0'>Total Charged</td><td style='padding:6px 0;color:#059669;font-weight:bold;font-size:18px;text-align:right;border-top:1px solid #bbf7d0'>${totalCharged:F2} CAD</td></tr>
      </table>
    </div>

    <p style='color:#64748b;font-size:14px'>Contact your goalkeeper directly at <strong>{goalkeeperPhone}</strong> if you need to coordinate anything.</p>

    {confirmSection}

    {cancelSection}

    <p style='color:#94a3b8;font-size:12px;text-align:center;margin-top:32px'>GoalieFinder Canada</p>
  </div>
</div>";

        await SendEmail(captainEmail, subject, body);
    }

    public async Task SendBookingDeclinedEmail(
        string captainEmail,
        string captainName,
        string goalkeeperName,
        string fieldName,
        DateTime matchDateTime)
    {
        var subject = $"Booking Update — {goalkeeperName} declined your request";
        var body = $@"
<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto'>
  <div style='background:#dc2626;padding:24px;text-align:center;border-radius:12px 12px 0 0'>
    <h1 style='color:white;margin:0;font-size:24px'>Booking Declined</h1>
  </div>
  <div style='background:white;padding:32px;border:1px solid #e2e8f0;border-top:none;border-radius:0 0 12px 12px'>
    <p style='font-size:16px;color:#1e293b'>Hey {captainName},</p>
    <p style='color:#64748b'>Unfortunately, <strong>{goalkeeperName}</strong> is unable to accept your booking for <strong>{fieldName}</strong> on <strong>{matchDateTime:MMM dd 'at' h:mm tt}</strong>.</p>
    <p style='color:#64748b'>The hold on your card has been <strong>released</strong> — you will not be charged.</p>
    <div style='text-align:center;margin:24px 0'>
      <a href='https://goaliefinders.com/matches/new' style='display:inline-block;background:#059669;color:white;padding:14px 32px;border-radius:8px;text-decoration:none;font-weight:bold'>
        Find Another Goalkeeper
      </a>
    </div>
    <p style='color:#94a3b8;font-size:12px;text-align:center;margin-top:32px'>GoalieFinder Canada</p>
  </div>
</div>";

        await SendEmail(captainEmail, subject, body);
    }

    public async Task SendGoalkeeperCancelledEmail(
        string captainEmail,
        string captainName,
        string goalkeeperName,
        string fieldName,
        DateTime matchDateTime)
    {
        var subject = $"Booking Cancelled — {goalkeeperName} cancelled the match";
        var body = $@"
<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto'>
  <div style='background:#dc2626;padding:24px;text-align:center;border-radius:12px 12px 0 0'>
    <h1 style='color:white;margin:0;font-size:24px'>Booking Cancelled</h1>
  </div>
  <div style='background:white;padding:32px;border:1px solid #e2e8f0;border-top:none;border-radius:0 0 12px 12px'>
    <p style='font-size:16px;color:#1e293b'>Hey {captainName},</p>
    <p style='color:#64748b'>Unfortunately, <strong>{goalkeeperName}</strong> has cancelled the booking for <strong>{fieldName}</strong> on <strong>{matchDateTime:MMM dd 'at' h:mm tt}</strong>.</p>
    <div style='background:#f0fdf4;border:1px solid #bbf7d0;border-radius:8px;padding:16px;margin:20px 0;text-align:center'>
      <p style='margin:0;color:#059669;font-weight:bold;font-size:16px'>100% Refund Issued</p>
      <p style='margin:4px 0 0;color:#64748b;font-size:14px'>The full amount has been refunded to your card.</p>
    </div>
    <p style='color:#64748b;font-size:14px'>We apologize for the inconvenience. Please try booking another goalkeeper.</p>
    <div style='text-align:center;margin:24px 0'>
      <a href='https://goaliefinders.com/matches/new' style='display:inline-block;background:#059669;color:white;padding:14px 32px;border-radius:8px;text-decoration:none;font-weight:bold'>
        Find Another Goalkeeper
      </a>
    </div>
    <p style='color:#94a3b8;font-size:12px;text-align:center;margin-top:32px'>GoalieFinder Canada</p>
  </div>
</div>";

        await SendEmail(captainEmail, subject, body);
    }

    private async Task SendEmail(string to, string subject, string htmlBody)
    {
        var smtpHost = _configuration["Email:SmtpHost"];
        var smtpUser = _configuration["Email:SmtpUser"];
        var smtpPass = _configuration["Email:SmtpPassword"];

        if (string.IsNullOrEmpty(smtpHost) || string.IsNullOrEmpty(smtpUser))
        {
            _logger.LogWarning("SMTP not configured. Would send email to {To}: {Subject}", to, subject);
            _logger.LogInformation("Email body preview for {To}:\n{Subject}", to, subject);
            return;
        }

        try
        {
            var smtpPort = int.Parse(_configuration["Email:SmtpPort"] ?? "587");
            using var client = new SmtpClient(smtpHost, smtpPort)
            {
                Credentials = new NetworkCredential(smtpUser, smtpPass),
                EnableSsl = true
            };

            var message = new MailMessage
            {
                From = new MailAddress(smtpUser, "GoalieFinder"),
                Subject = subject,
                IsBodyHtml = true,
                Body = htmlBody
            };
            message.To.Add(to);

            await client.SendMailAsync(message);
            _logger.LogInformation("Email sent to {To}: {Subject}", to, subject);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to send email to {To}", to);
        }
    }
}
