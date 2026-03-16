using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.Common.Models;
using GoalieFinder.Application.DTOs;
using GoalieFinder.Domain.Entities;
using MediatR;

namespace GoalieFinder.Application.Features.Auth;

public record RegisterCommand(RegisterRequest Request) : IRequest<Result<AuthResponse>>;

public class RegisterCommandHandler : IRequestHandler<RegisterCommand, Result<AuthResponse>>
{
    private readonly IApplicationDbContext _context;
    private readonly ITokenService _tokenService;

    public RegisterCommandHandler(IApplicationDbContext context, ITokenService tokenService)
    {
        _context = context;
        _tokenService = tokenService;
    }

    public async Task<Result<AuthResponse>> Handle(RegisterCommand command, CancellationToken cancellationToken)
    {
        var request = command.Request;

        var existingUser = _context.Users.FirstOrDefault(u => u.Email == request.Email);
        if (existingUser != null)
            return Result<AuthResponse>.Failure("Email already registered");

        if (!Enum.TryParse<UserRole>(request.Role, true, out var role))
            return Result<AuthResponse>.Failure("Invalid role. Use 'TeamCaptain' or 'Goalkeeper'");

        if (role == UserRole.Admin)
            return Result<AuthResponse>.Failure("Cannot register as admin");

        var user = new User
        {
            Email = request.Email,
            PasswordHash = BCrypt.Net.BCrypt.HashPassword(request.Password),
            FirstName = request.FirstName,
            LastName = request.LastName,
            PhoneNumber = request.PhoneNumber,
            Role = role
        };

        _context.Users.Add(user);

        if (role == UserRole.Goalkeeper)
        {
            _context.GoalkeeperProfiles.Add(new GoalkeeperProfile { UserId = user.Id });
        }
        else if (role == UserRole.TeamCaptain)
        {
            _context.TeamProfiles.Add(new TeamProfile
            {
                UserId = user.Id,
                TeamName = $"{request.FirstName}'s Team"
            });
        }

        await _context.SaveChangesAsync(cancellationToken);

        var accessToken = _tokenService.GenerateAccessToken(user);
        var refreshToken = _tokenService.GenerateRefreshToken();

        var userDto = new UserDto(user.Id, user.Email, user.FirstName, user.LastName,
            user.PhoneNumber, user.ProfilePhotoUrl, user.Role.ToString(), user.IsVerified);

        return Result<AuthResponse>.Created(new AuthResponse(accessToken, refreshToken, userDto));
    }
}
