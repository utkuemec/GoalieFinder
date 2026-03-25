using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.Infrastructure.Persistence;

public class ApplicationDbContext : DbContext, IApplicationDbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

    public DbSet<User> Users => Set<User>();
    public DbSet<GoalkeeperProfile> GoalkeeperProfiles => Set<GoalkeeperProfile>();
    public DbSet<GoalkeeperAvailability> GoalkeeperAvailabilities => Set<GoalkeeperAvailability>();
    public DbSet<TeamProfile> TeamProfiles => Set<TeamProfile>();
    public DbSet<Match> Matches => Set<Match>();
    public DbSet<MatchAcceptance> MatchAcceptances => Set<MatchAcceptance>();
    public DbSet<Review> Reviews => Set<Review>();
    public DbSet<Payment> Payments => Set<Payment>();
    public DbSet<Notification> Notifications => Set<Notification>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasIndex(e => e.Email).IsUnique();
            entity.Property(e => e.Email).HasMaxLength(256);
            entity.Property(e => e.FirstName).HasMaxLength(100);
            entity.Property(e => e.LastName).HasMaxLength(100);
            entity.Property(e => e.PhoneNumber).HasMaxLength(20);
            entity.Property(e => e.PasswordHash).HasMaxLength(256);
        });

        modelBuilder.Entity<GoalkeeperProfile>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasOne(e => e.User).WithOne(u => u.GoalkeeperProfile)
                .HasForeignKey<GoalkeeperProfile>(e => e.UserId).OnDelete(DeleteBehavior.Cascade);
            entity.Property(e => e.PricePerMatch).HasColumnType("decimal(10,2)");
            entity.HasIndex(e => new { e.Latitude, e.Longitude });
            entity.HasIndex(e => e.IsAvailable);
        });

        modelBuilder.Entity<GoalkeeperAvailability>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasOne(e => e.GoalkeeperProfile).WithMany(g => g.Availabilities)
                .HasForeignKey(e => e.GoalkeeperProfileId).OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<TeamProfile>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasOne(e => e.User).WithOne(u => u.TeamProfile)
                .HasForeignKey<TeamProfile>(e => e.UserId).OnDelete(DeleteBehavior.Cascade);
            entity.Property(e => e.TeamName).HasMaxLength(200);
        });

        modelBuilder.Entity<Match>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasOne(e => e.TeamProfile).WithMany(t => t.Matches)
                .HasForeignKey(e => e.TeamProfileId).OnDelete(DeleteBehavior.Cascade);
            entity.Property(e => e.PaymentAmount).HasColumnType("decimal(10,2)");
            entity.Property(e => e.PlatformFee).HasColumnType("decimal(10,2)");
            entity.Property(e => e.TotalAmount).HasColumnType("decimal(10,2)");
            entity.Property(e => e.FieldName).HasMaxLength(200);
            entity.Property(e => e.FieldAddress).HasMaxLength(500);
            entity.HasIndex(e => e.Status);
            entity.HasIndex(e => e.MatchDateTime);
            entity.HasIndex(e => new { e.FieldLatitude, e.FieldLongitude });
        });

        modelBuilder.Entity<MatchAcceptance>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasOne(e => e.Match).WithMany(m => m.Acceptances)
                .HasForeignKey(e => e.MatchId).OnDelete(DeleteBehavior.Cascade);
            entity.HasOne(e => e.GoalkeeperProfile).WithMany(g => g.MatchAcceptances)
                .HasForeignKey(e => e.GoalkeeperProfileId).OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<Review>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasOne(e => e.Match).WithMany(m => m.Reviews)
                .HasForeignKey(e => e.MatchId).OnDelete(DeleteBehavior.Cascade);
            entity.HasOne(e => e.Reviewer).WithMany(u => u.ReviewsGiven)
                .HasForeignKey(e => e.ReviewerId).OnDelete(DeleteBehavior.Restrict);
            entity.HasOne(e => e.Reviewee).WithMany(u => u.ReviewsReceived)
                .HasForeignKey(e => e.RevieweeId).OnDelete(DeleteBehavior.Restrict);
            entity.Property(e => e.Comment).HasMaxLength(1000);
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasOne(e => e.Match).WithOne(m => m.Payment)
                .HasForeignKey<Payment>(e => e.MatchId).OnDelete(DeleteBehavior.Cascade);
            entity.Property(e => e.Amount).HasColumnType("decimal(10,2)");
            entity.Property(e => e.PlatformFee).HasColumnType("decimal(10,2)");
            entity.Property(e => e.GoalkeeperPayout).HasColumnType("decimal(10,2)");
            entity.Property(e => e.StripePaymentIntentId).HasMaxLength(256);
        });

        modelBuilder.Entity<Notification>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasOne(e => e.User).WithMany(u => u.Notifications)
                .HasForeignKey(e => e.UserId).OnDelete(DeleteBehavior.Cascade);
            entity.Property(e => e.Title).HasMaxLength(200);
            entity.Property(e => e.Message).HasMaxLength(1000);
            entity.HasIndex(e => new { e.UserId, e.IsRead });
        });

        base.OnModelCreating(modelBuilder);
    }
}
