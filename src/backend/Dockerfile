FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

COPY GoalieFinder.Domain/GoalieFinder.Domain.csproj GoalieFinder.Domain/
COPY GoalieFinder.Application/GoalieFinder.Application.csproj GoalieFinder.Application/
COPY GoalieFinder.Infrastructure/GoalieFinder.Infrastructure.csproj GoalieFinder.Infrastructure/
COPY GoalieFinder.API/GoalieFinder.API.csproj GoalieFinder.API/

RUN dotnet restore GoalieFinder.API/GoalieFinder.API.csproj

COPY . .
RUN dotnet publish GoalieFinder.API/GoalieFinder.API.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 5000
ENTRYPOINT ["dotnet", "GoalieFinder.API.dll"]
