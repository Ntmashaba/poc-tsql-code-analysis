# POC T-SQL Code Analysis

This project demonstrates how to perform code analysis on T-SQL files using MSBuild, Docker, and SonarQube in a GitLab CI/CD pipeline.

## Project Structure

poc-tsql-code-analysis/
├── Dockerfile
├── SqlProject/
│ ├── Database1.sqlproj
│ └── TestScript.sql
└── .gitlab-ci.yml

- `Dockerfile`: A Dockerfile that sets up the build environment, including installing MSBuild, the .NET SDK, and the SonarScanner for MSBuild.
- `SqlProject`: A directory containing an MSBuild-based SQL project and a sample T-SQL script.
- `.gitlab-ci.yml`: The GitLab CI/CD pipeline configuration file that builds and analyzes the T-SQL code using Docker and sends the results to SonarQube.

## Prerequisites

1. GitLab instance with CI/CD enabled.
2. Docker installed on your local machine or the GitLab Runner machine.
3. SonarQube instance (Developer Edition or higher) with the T-SQL plugin installed.

## Usage

1. Replace the `SONAR_HOST_URL` and `SONAR_TOKEN` variables in the `.gitlab-ci.yml` file with the appropriate values for your SonarQube instance.

2. Commit and push the project to your GitLab repository.

3. The GitLab CI/CD pipeline will be triggered automatically upon pushing changes to the repository. The pipeline will build and analyze the T-SQL code using Docker and MSBuild, then send the results to the configured SonarQube server.

4. Check your SonarQube instance for the analysis results.