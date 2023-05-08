FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN apt-get update && apt-get install -y unzip

WORKDIR /sonar

RUN wget https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/5.3.2.36287/SonarScanner.MSBuild.zip \
    && unzip SonarScanner.MSBuild.zip \
    && rm SonarScanner.MSBuild.zip

ENV PATH="/sonar:/sonar/sonar-scanner-5.3.2.36287:/sonar/sonar-scanner-5.3.2.36287/bin:${PATH}"
