FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 23174
EXPOSE 44310

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY services/applicants.api/applicants.api.csproj services/applicants.api/
COPY Foundation/Events/Events.csproj Foundation/Events/
RUN dotnet restore services/applicants.api/applicants.api.csproj
COPY . .
WORKDIR /src/services/applicants.api
RUN dotnet build applicants.api.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish applicants.api.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "applicants.api.dll"]
