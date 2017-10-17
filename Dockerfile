# on page 43 listing 4.6, Freeman uses aspnetcore:1.1.1 but when I built the image, the dotnet 
# ysed aspnetcore:1.2
# I also had to use to dotnet command:
# dotnet publish --framework netcoreapp1.2 --configuration Release --output dist

FROM microsoft/aspnetcore:1.1.2

COPY dist /app

COPY node_modules/wait-for-it.sh/bin/wait-for-it /app/wait-for-it.sh

RUN chmod +x /app/wait-for-it.sh

WORKDIR /app

EXPOSE 80/tcp

ENV WAITHOST=mysql WAITPORT=3306

ENTRYPOINT ./wait-for-it.sh $WAITHOST:$WAITPORT --timeout=0 \
    && exec dotnet ExampleApp.dll