FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 17040
EXPOSE 44363

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY services/identity.api/identity.api.csproj services/identity.api/
COPY Foundation/Events/Events.csproj Foundation/Events/
RUN dotnet restore services/identity.api/identity.api.csproj
COPY . .
WORKDIR /src/services/identity.api
RUN dotnet build identity.api.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish identity.api.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "identity.api.dll"]
