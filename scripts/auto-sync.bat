@echo off
REM Auto Git Sync - Watches for changes and auto-commits & pushes
REM This script monitors the folder for changes and automatically:
REM   1. Stages all changes (git add .)
REM   2. Commits with auto-generated message
REM   3. Pushes to GitHub

setlocal enabledelayedexpansion

echo.
echo ========================================
echo   Auto Git Sync - File Watcher
echo ========================================
echo.

REM Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed or not in PATH
    pause
    exit /b 1
)

REM Check if .git exists
if not exist ".git" (
    echo [ERROR] Git repository not found
    echo Please run this from the project root
    pause
    exit /b 1
)

echo [✓] Git repository found
echo.
echo Starting auto-sync watcher...
echo.
echo This script will:
echo   - Monitor project files for changes
echo   - Auto-commit every change
echo   - Auto-push to GitHub
echo.
echo Press Ctrl+C to stop watching
echo.
echo ========================================
echo.

REM Initialize last check time
set lastCheck=0

:monitor_loop
REM Get current timestamp of all modified files
for /f %%A in ('powershell -Command "Get-ChildItem -Recurse -File | Where-Object {$_.LastWriteTime -gt (Get-Date).AddSeconds(-30)} | Measure-Object | Select-Object -ExpandProperty Count"') do (
    set changedCount=%%A
)

REM If there are changes
if !changedCount! gtr 0 (
    echo.
    echo [!] Changes detected - Syncing...
    
    REM Get current time for commit message
    for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
    for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
    
    REM Stage all changes
    git add .
    
    REM Create commit with timestamp
    git commit -m "Auto-sync: !mydate! !mytime!" -q
    
    if !ERRORLEVEL! EQU 0 (
        echo [✓] Commit created
        
        REM Push to GitHub
        git push origin main -q
        
        if !ERRORLEVEL! EQU 0 (
            echo [✓] Pushed to GitHub
        ) else (
            echo [!] Push failed - check network connection
        )
    ) else (
        REM No changes to commit (already synced)
        echo [!] No changes to commit (already up to date)
    )
)

REM Wait before checking again (every 5 seconds)
timeout /t 5 /nobreak >nul

goto monitor_loop
