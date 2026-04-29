@echo off
REM Quick Fix for Shift Roster - Rebuild and restart

echo.
echo Rebuilding container with fixed nginx config...
docker-compose down
docker-compose up --build -d

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [✓] Container rebuilt successfully
    echo Waiting for container to be ready...
    timeout /t 3
    echo.
    echo Opening http://localhost:8080 in browser...
    start http://localhost:8080
) else (
    echo.
    echo [ERROR] Failed to rebuild
    pause
)
