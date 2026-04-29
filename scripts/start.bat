@echo off
REM Start Shift Roster Docker Container
REM This script builds and starts the shift roster application

echo.
echo ========================================
echo   Shift Roster - Docker Startup
echo ========================================
echo.

REM Check if Docker is installed
where docker >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Docker is not installed or not in PATH
    echo Please install Docker Desktop from: https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)

REM Check if Docker daemon is running
docker info >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Docker daemon is not running
    echo Please start Docker Desktop and try again
    pause
    exit /b 1
)

echo [✓] Docker is installed and running
echo.
echo Starting shift roster container...
echo.

REM Build and run containers
docker-compose up --build -d

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   [✓] Container started successfully!
    echo ========================================
    echo.
    echo Access the application at:
    echo   http://localhost:8080
    echo.
    echo Available versions:
    echo   - V5 (Latest):  http://localhost:8080/V5_roster_dynamic.html
    echo   - V4:           http://localhost:8080/V4_roster_dynamic.html
    echo   - V3:           http://localhost:8080/V3_roster_dynamic.html
    echo   - V2:           http://localhost:8080/roster_v2.html
    echo.
    echo Run "docker ps" to see running containers
    echo Run "docker logs shift-roster-app" to view logs
    echo.
    timeout /t 3
) else (
    echo.
    echo [ERROR] Failed to start container
    echo Run "docker logs shift-roster-app" for more details
    pause
)
