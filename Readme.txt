cd C:\Users\kasta\OneDrive\кпи\2020 3 сесия\вовк кпи-3\zabolotnyi-zpi-zp-92-lab-kpi-3
dotnet new mvc -f net5.0
dotnet run -v n
https://localhost:5001
shutt down ctrl+c
open zabolotnyi-zpi-zp-92-lab-kpi-3
run

webBuilder.UseUrls("http://*:" + Environment.GetEnvironmentVariable("PORT")); 
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

save
пересобрать
dotnet restore
heroku login
heroku container:login

docker build -t counter-image-five -f Dockerfile .
docker create --name core-counter-five counter-image-five
docker ps -a

docker tag counter-image-five registry.heroku.com/zabolotnyi-zpi-zp-92-lab-kpi-3/web
docker push registry.heroku.com/zabolotnyi-zpi-zp-92-lab-kpi-3/web
heroku container:release web -a=zabolotnyi-zpi-zp-92-lab-kpi-3

heroku logs --tail -a=zabolotnyi-zpi-zp-92-lab-kpi-3