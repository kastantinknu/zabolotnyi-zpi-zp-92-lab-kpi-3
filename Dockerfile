FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app
COPY zabolotnyi-zpi-zp-92-lab-kpi-3.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o out
FROM mcr.microsoft.com/dotnet/sdk:5.0
WORKDIR /app
COPY --from=build-env /app/out . 
ENTRYPOINT ["dotnet", "zabolotnyi-zpi-zp-92-lab-kpi-3.dll"]