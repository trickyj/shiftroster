@echo off
REM Git Commit & Push - One command to commit all changes and push
REM Run this whenever you want to save changes to GitHub

echo.
echo ========================================
echo   Git Commit & Push
echo ========================================
echo.

where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed
    pause
    exit /b 1
)

if not exist ".git" (
    echo [ERROR] Not a git repository
    pause
    exit /b 1
)

REM Get current time for commit message
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)

echo Staging changes...
git add .

echo Committing...
git commit -m "Update: !mydate! !mytime!" -m "Auto-committed changes"

if !ERRORLEVEL! NEQ 0 (
    echo.
    echo [!] No changes to commit
    pause
    exit /b 0
)

echo Pushing to GitHub...
git push origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   [✓] Successfully synced to GitHub!
    echo ========================================
    timeout /t 2
) else (
    echo.
    echo [ERROR] Failed to push
    echo Check your internet connection
    pause
)
