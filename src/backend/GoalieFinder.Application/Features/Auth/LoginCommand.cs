using GoalieFinder.Application.Common.Interfaces;
using GoalieFinder.Application.Common.Models;
using GoalieFinder.Application.DTOs;
using MediatR;

namespace GoalieFinder.Application.Features.Auth;

public record LoginCommand(LoginRequest Request) : IRequest<Result<AuthResponse>>;

public class LoginCommandHandler : IRequestHandler<LoginCommand, Result<AuthResponse>>
{
    private readonly IApplicationDbContext _context;
    private readonly ITokenService _tokenService;

    public LoginCommandHandler(IApplicationDbContext context, ITokenService tokenService)
    {
        _context = context;
        _tokenService = tokenService;
    }

    public Task<Result<AuthResponse>> Handle(LoginCommand command, CancellationToken cancellationToken)
    {
        var user = _context.Users.FirstOrDefault(u => u.Email == command.Request.Email);
        if (user == null || !BCrypt.Net.BCrypt.Verify(command.Request.Password, user.PasswordHash))
            return Task.FromResult(Result<AuthResponse>.Unauthorized("Invalid email or password"));

        if (!user.IsActive)
            return Task.FromResult(Result<AuthResponse>.Failure("Account is deactivated"));

        var accessToken = _tokenService.GenerateAccessToken(user);
        var refreshToken = _tokenService.GenerateRefreshToken();

        var userDto = new UserDto(user.Id, user.Email, user.FirstName, user.LastName,
            user.PhoneNumber, user.ProfilePhotoUrl, user.Role.ToString(), user.IsVerified);

        return Task.FromResult(Result<AuthResponse>.Success(new AuthResponse(accessToken, refreshToken, userDto)));
    }
}
