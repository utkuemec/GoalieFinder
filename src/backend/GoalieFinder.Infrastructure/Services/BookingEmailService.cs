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

    Task SendPaymentReleasedEmail(
        string goalkeeperEmail,
        string goalkeeperName,
        string fieldName,
        DateTime matchDateTime,
        decimal payoutAmount);

    Task SendPayoutSetupReminderEmail(
        string goalkeeperEmail,
        string goalkeeperName,
        bool hasCompletedPayout);
}

public class BookingEmailService : IBookingEmailService
{
    private readonly ILogger<BookingEmailService> _logger;
    private readonly IConfiguration _configuration;
    private static readonly TimeZoneInfo EasternTz = TimeZoneInfo.FindSystemTimeZoneById("America/Toronto");

    public BookingEmailService(ILogger<BookingEmailService> logger, IConfiguration configuration)
    {
        _logger = logger;
        _configuration = configuration;
    }

    private static DateTime ToLocal(DateTime utc) =>
        TimeZoneInfo.ConvertTimeFromUtc(
            DateTime.SpecifyKind(utc, DateTimeKind.Utc), EasternTz);

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
          <td style='padding:8px 0;color:#1e293b;font-weight:bold;text-align:right;border-top:1px solid #e2e8f0'>{ToLocal(matchDateTime):dddd, MMMM dd, yyyy 'at' h:mm tt}</td>
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
        <tr><td style='padding:6px 0;color:#64748b;font-size:14px'>Date & Time</td><td style='padding:6px 0;color:#1e293b;font-weight:bold;text-align:right'>{ToLocal(matchDateTime):dddd, MMM dd 'at' h:mm tt}</td></tr>
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
    <p style='color:#64748b'>Unfortunately, <strong>{goalkeeperName}</strong> is unable to accept your booking for <strong>{fieldName}</strong> on <strong>{ToLocal(matchDateTime):MMM dd 'at' h:mm tt}</strong>.</p>
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
    <p style='color:#64748b'>Unfortunately, <strong>{goalkeeperName}</strong> has cancelled the booking for <strong>{fieldName}</strong> on <strong>{ToLocal(matchDateTime):MMM dd 'at' h:mm tt}</strong>.</p>
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

    public async Task SendPaymentReleasedEmail(
        string goalkeeperEmail, string goalkeeperName,
        string fieldName, DateTime matchDateTime, decimal payoutAmount)
    {
        var subject = $"Payment Received — ${payoutAmount:F2} CAD for your match";
        var body = $@"
<div style=""font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;max-width:600px;margin:0 auto;padding:20px"">
  <div style=""background:#10b981;padding:24px;border-radius:12px 12px 0 0;text-align:center"">
    <h1 style=""color:white;margin:0;font-size:24px"">Payment Received!</h1>
  </div>
  <div style=""background:#f8fafc;padding:24px;border:1px solid #e2e8f0;border-top:none;border-radius:0 0 12px 12px"">
    <p style=""color:#334155;font-size:16px"">Hi {goalkeeperName},</p>
    <p style=""color:#334155;font-size:16px"">Great news! Your payment has been released for your completed match.</p>
    <div style=""background:white;border:1px solid #e2e8f0;border-radius:8px;padding:16px;margin:16px 0"">
      <table style=""width:100%;border-collapse:collapse"">
        <tr><td style=""color:#64748b;padding:8px 0"">Match</td><td style=""color:#0f172a;font-weight:600;text-align:right;padding:8px 0"">{fieldName}</td></tr>
        <tr><td style=""color:#64748b;padding:8px 0"">Date</td><td style=""color:#0f172a;font-weight:600;text-align:right;padding:8px 0"">{ToLocal(matchDateTime):MMMM dd, yyyy 'at' h:mm tt}</td></tr>
        <tr style=""border-top:2px solid #10b981""><td style=""color:#10b981;font-weight:700;padding:12px 0;font-size:18px"">Amount Paid</td><td style=""color:#10b981;font-weight:700;text-align:right;padding:12px 0;font-size:18px"">${payoutAmount:F2} CAD</td></tr>
      </table>
    </div>
    <p style=""color:#64748b;font-size:14px"">The funds will be deposited to your connected bank account via Stripe. This typically takes 2-3 business days.</p>
    <p style=""color:#64748b;font-size:14px;margin-top:16px"">Thank you for using GoalieFinder!</p>
  </div>
</div>";

        await SendEmail(goalkeeperEmail, subject, body);
    }

    public async Task SendPayoutSetupReminderEmail(
        string goalkeeperEmail, string goalkeeperName, bool hasCompletedPayout)
    {
        var subject = "GoalieFinder — We're Growing! Here's What You Need to Know";

        var ctaSection = hasCompletedPayout
            ? @"
    <div style='background:#f0fdf4;border:1px solid #bbf7d0;border-radius:8px;padding:20px;margin:20px 0;text-align:center'>
      <p style='margin:0;color:#059669;font-weight:bold;font-size:16px'>&#10003; Your payout setup is complete!</p>
      <p style='margin:8px 0 0;color:#64748b;font-size:14px'>You&rsquo;re all set to receive bookings and get paid. No action needed.</p>
    </div>"
            : @"
    <div style='background:#fef3c7;border:1px solid #fde68a;border-radius:8px;padding:20px;margin:20px 0'>
      <p style='margin:0 0 8px;color:#92400e;font-weight:bold;font-size:16px'>&#9888; Action Required: Complete Your Payout Setup</p>
      <p style='margin:0 0 16px;color:#78350f;font-size:14px'>
        You are <strong>not visible to teams</strong> and <strong>cannot receive bookings</strong> until you set up your bank account.
        It only takes 2 minutes!
      </p>
      <div style='text-align:center'>
        <a href='https://goaliefinders.com/dashboard/goalkeeper' style='display:inline-block;background:#059669;color:white;padding:14px 32px;border-radius:8px;text-decoration:none;font-weight:bold;font-size:16px'>
          Complete Payout Setup Now
        </a>
      </div>
    </div>";

        var body = $@"
<div style='font-family:-apple-system,BlinkMacSystemFont,""Segoe UI"",Roboto,sans-serif;max-width:600px;margin:0 auto;padding:0'>
  <div style='background:#059669;padding:28px;text-align:center;border-radius:12px 12px 0 0'>
    <h1 style='color:white;margin:0;font-size:26px'>GoalieFinder is Growing!</h1>
    <p style='color:#d1fae5;margin:8px 0 0;font-size:14px'>Thank you for being part of our community</p>
  </div>
  <div style='background:white;padding:32px;border:1px solid #e2e8f0;border-top:none;border-radius:0 0 12px 12px'>
    <p style='font-size:16px;color:#1e293b'>Hi {goalkeeperName},</p>
    <p style='color:#64748b;font-size:15px;line-height:1.6'>
      Thank you for joining GoalieFinder! We&rsquo;re improving every day to connect goalkeepers like you
      with teams across Canada. Your support means everything to us.
    </p>

    {ctaSection}

    <div style='background:#f8fafc;border-radius:8px;padding:24px;margin:24px 0'>
      <h3 style='margin:0 0 16px;color:#1e293b;font-size:16px'>&#128176; How You Get Paid</h3>
      <table style='width:100%;border-collapse:collapse'>
        <tr>
          <td style='padding:10px 12px;vertical-align:top;width:32px'>
            <div style='background:#d1fae5;color:#059669;width:28px;height:28px;border-radius:50%;text-align:center;line-height:28px;font-weight:bold;font-size:14px'>1</div>
          </td>
          <td style='padding:10px 0;color:#475569;font-size:14px'>
            <strong style='color:#1e293b'>A captain books you</strong><br/>
            They pay upfront. The payment is held securely by Stripe.
          </td>
        </tr>
        <tr>
          <td style='padding:10px 12px;vertical-align:top'>
            <div style='background:#d1fae5;color:#059669;width:28px;height:28px;border-radius:50%;text-align:center;line-height:28px;font-weight:bold;font-size:14px'>2</div>
          </td>
          <td style='padding:10px 0;color:#475569;font-size:14px'>
            <strong style='color:#1e293b'>You accept the booking</strong><br/>
            The payment is captured. You&rsquo;ll see full match details and captain contact info.
          </td>
        </tr>
        <tr>
          <td style='padding:10px 12px;vertical-align:top'>
            <div style='background:#d1fae5;color:#059669;width:28px;height:28px;border-radius:50%;text-align:center;line-height:28px;font-weight:bold;font-size:14px'>3</div>
          </td>
          <td style='padding:10px 0;color:#475569;font-size:14px'>
            <strong style='color:#1e293b'>After the match, you get paid automatically</strong><br/>
            Your earnings are transferred directly to your bank account.
            Funds arrive in <strong>2&ndash;3 business days</strong>. No action needed from you!
          </td>
        </tr>
      </table>
    </div>

    <div style='background:#eff6ff;border:1px solid #bfdbfe;border-radius:8px;padding:16px;margin:20px 0'>
      <p style='margin:0;color:#1e40af;font-size:14px'>
        <strong>&#128161; Tip:</strong> You can view your earnings and upcoming matches anytime on your
        <a href='https://goaliefinders.com/dashboard/goalkeeper' style='color:#059669;font-weight:bold'>dashboard</a>.
        Your money goes straight to the bank account you provided &mdash; no need to log into Stripe or transfer anything manually.
      </p>
    </div>

    <p style='color:#64748b;font-size:14px;margin-top:24px'>
      If you&rsquo;ve already completed your payout setup, you can safely ignore this email.
      We&rsquo;re just making sure every goalkeeper is ready to earn!
    </p>

    <p style='color:#64748b;font-size:14px;margin-top:16px'>
      Have questions? Reply to this email and we&rsquo;ll get back to you.
    </p>

    <p style='color:#1e293b;font-size:14px;margin-top:24px'>
      Best,<br/>
      <strong>The GoalieFinder Team</strong>
    </p>

    <div style='border-top:1px solid #e2e8f0;margin-top:32px;padding-top:16px;text-align:center'>
      <p style='color:#94a3b8;font-size:12px;margin:0'>
        GoalieFinder Canada &mdash; Connecting goalkeepers with teams across Canada
      </p>
      <p style='color:#cbd5e1;font-size:11px;margin:4px 0 0'>
        <a href='https://goaliefinders.com' style='color:#94a3b8'>goaliefinders.com</a>
      </p>
    </div>
  </div>
</div>";

        await SendEmail(goalkeeperEmail, subject, body);
    }
}
