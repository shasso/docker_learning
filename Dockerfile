# on page 43 listing 4.6, Freeman uses aspnetcore:1.1.1 but when I built the image, the dotnet 
# ysed aspnetcore:1.2
# I also had to use to dotnet command:
# dotnet publish --framework netcoreapp1.2 --configuration Release --output dist

FROM microsoft/aspnetcore:1.1.2
 
COPY dist /app

WORKDIR /app

EXPOSE 80/tcp

ENTRYPOINT ["dotnet", "ExampleApp.dll"]