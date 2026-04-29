@echo off
REM Stop Shift Roster Docker Container

echo.
echo ========================================
echo   Stopping Shift Roster Container
echo ========================================
echo.

docker-compose down

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [✓] Container stopped successfully
    echo.
    timeout /t 2
) else (
    echo.
    echo [ERROR] Failed to stop container
    pause
)
