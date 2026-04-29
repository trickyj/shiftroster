@echo off
REM View logs from Shift Roster Container

echo.
echo ========================================
echo   Shift Roster - Container Logs
echo ========================================
echo.

docker logs -f shift-roster-app

pause
