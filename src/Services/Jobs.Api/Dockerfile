FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 33032
EXPOSE 44354

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY services/jobs.api/jobs.api.csproj services/jobs.api/
COPY Foundation/Events/Events.csproj Foundation/Events/
RUN dotnet restore services/jobs.api/jobs.api.csproj
COPY . .
WORKDIR /src/services/jobs.api
RUN dotnet build jobs.api.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish jobs.api.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "jobs.api.dll"]
