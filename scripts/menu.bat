@echo off
REM Shift Roster - Docker Helper Menu

:menu
cls
echo.
echo ========================================
echo   Shift Roster - Docker Management
echo ========================================
echo.
echo 1. Start Container
echo 2. Stop Container
echo 3. View Logs
echo 4. Rebuild Container
echo 5. Open in Browser
echo 6. View Running Containers
echo 7. Exit
echo.
set /p choice="Enter your choice (1-7): "

if "%choice%"=="1" (
    call start.bat
    goto menu
)
if "%choice%"=="2" (
    call stop.bat
    goto menu
)
if "%choice%"=="3" (
    call logs.bat
    goto menu
)
if "%choice%"=="4" (
    call rebuild.bat
    goto menu
)
if "%choice%"=="5" (
    call open.bat
    goto menu
)
if "%choice%"=="6" (
    echo.
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
    echo.
    pause
    goto menu
)
if "%choice%"=="7" (
    exit /b 0
)

echo [ERROR] Invalid choice
timeout /t 1
goto menu
