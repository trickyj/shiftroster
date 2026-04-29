@echo off
REM Open Shift Roster in Default Browser

echo.
echo ========================================
echo   Opening Shift Roster in Browser
echo ========================================
echo.

echo Checking if container is running...
docker ps | find "shift-roster-app" >nul 2>nul

if %ERRORLEVEL% NEQ 0 (
    echo [WARNING] Container is not running. Starting it now...
    call start.bat
)

echo.
echo [✓] Opening http://localhost:8080 in your default browser...
start http://localhost:8080

timeout /t 2
