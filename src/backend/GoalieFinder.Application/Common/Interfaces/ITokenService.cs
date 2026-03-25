using GoalieFinder.Domain.Entities;

namespace GoalieFinder.Application.Common.Interfaces;

public interface ITokenService
{
    string GenerateAccessToken(User user);
    string GenerateRefreshToken();
}
