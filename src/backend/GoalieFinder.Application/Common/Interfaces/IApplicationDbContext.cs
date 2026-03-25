using GoalieFinder.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalieFinder.Application.Common.Interfaces;

public interface IApplicationDbContext
{
    DbSet<User> Users { get; }
    DbSet<GoalkeeperProfile> GoalkeeperProfiles { get; }
    DbSet<GoalkeeperAvailability> GoalkeeperAvailabilities { get; }
    DbSet<TeamProfile> TeamProfiles { get; }
    DbSet<Match> Matches { get; }
    DbSet<MatchAcceptance> MatchAcceptances { get; }
    DbSet<Review> Reviews { get; }
    DbSet<Payment> Payments { get; }
    DbSet<Notification> Notifications { get; }
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}
