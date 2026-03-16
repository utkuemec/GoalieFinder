namespace GoalieFinder.Application.DTOs;

public record UserDto(
    Guid Id,
    string Email,
    string FirstName,
    string LastName,
    string PhoneNumber,
    string? ProfilePhotoUrl,
    string Role,
    bool IsVerified
);
