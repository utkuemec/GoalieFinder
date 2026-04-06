using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Infrastructure.Persistence;
using GoalieFinder.Infrastructure.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace GoalieFinder.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("DefaultConnection");

        services.AddDbContext<ApplicationDbContext>(options =>
        {
            if (!string.IsNullOrEmpty(connectionString) && connectionString != "InMemory")
            {
                options.UseNpgsql(connectionString,
                    b => b.MigrationsAssembly(typeof(ApplicationDbContext).Assembly.FullName))
                    .UseSnakeCaseNamingConvention();
            }
            else
            {
                options.UseInMemoryDatabase("GoalieFinder");
            }
        });

        services.AddScoped<IApplicationDbContext>(provider => provider.GetRequiredService<ApplicationDbContext>());
        services.AddScoped<ITokenService, TokenService>();
        services.AddScoped<INotificationService, NotificationService>();
        services.AddScoped<IPaymentService, PaymentService>();
        services.AddSingleton<IVerificationService, EmailVerificationService>();
        services.AddScoped<IBookingEmailService, BookingEmailService>();
        services.AddHostedService<BotAutoDeclineService>();
        services.AddHostedService<AutoPayoutService>();

        return services;
    }
}
