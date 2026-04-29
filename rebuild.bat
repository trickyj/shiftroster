@echo off
REM Rebuild Shift Roster Docker Image

echo.
echo ========================================
echo   Rebuilding Shift Roster Container
echo ========================================
echo.

docker-compose down --rmi all
echo.
docker-compose up --build -d

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [✓] Container rebuilt successfully
    echo.
    timeout /t 2
) else (
    echo.
    echo [ERROR] Failed to rebuild container
    pause
)
