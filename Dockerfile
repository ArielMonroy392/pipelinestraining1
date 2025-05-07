FROM mcr.microsoft.com/dotnet/runtime-deps:8.0

WORKDIR /app

COPY ./publish/ .

ENTRYPOINT ["./myApp"]
