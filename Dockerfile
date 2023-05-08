# Use the .NET 6 SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:6.0

# Install SonarScanner for .NET
ENV SONAR_SCANNER_VERSION=5.3.2
ENV SONAR_SCANNER_MSBUILD_VERSION=5.3.1
RUN apt-get update && apt-get install -y wget openjdk-11-jre
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
    && unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
    && mv sonar-scanner-${SONAR_SCANNER_VERSION}-linux /opt/sonar-scanner \
    && wget https://binaries.sonarsource.com/Distribution/sonar-scanner-msbuild/sonar-scanner-msbuild-${SONAR_SCANNER_MSBUILD_VERSION}-net5.0.zip \
    && unzip sonar-scanner-msbuild-${SONAR_SCANNER_MSBUILD_VERSION}-net5.0.zip \
    && mv sonar-scanner-msbuild-${SONAR_SCANNER_MSBUILD_VERSION}-net5.0 /opt/sonar-scanner-msbuild
ENV PATH="/opt/sonar-scanner/bin:/opt/sonar-scanner-msbuild:${PATH}"

# Set the working directory
WORKDIR /src

# Copy your T-SQL project files into the container
COPY . .

# Run the SonarScanner for MSBuild
CMD ["sh", "-c", "dotnet restore && \
    sonar-scanner-msbuild begin /k:\"MyProject\" /d:sonar.host.url=\"$SONAR_HOST_URL\" /d:sonar.login=\"$SONAR_TOKEN\" && \
    dotnet build && \
    sonar-scanner-msbuild end /d:sonar.login=\"$SONAR_TOKEN\""]