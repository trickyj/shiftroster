@echo off
REM Easy GitHub Push Script

echo.
echo ========================================
echo   Push to GitHub
echo ========================================
echo.

where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed
    pause
    exit /b 1
)

set /p repo_url="Enter your GitHub repository URL (e.g., https://github.com/username/shift-roster): "

if "%repo_url%"=="" (
    echo [ERROR] No URL provided
    pause
    exit /b 1
)

echo.
echo Adding remote origin...
git remote add origin %repo_url%

echo.
echo Setting branch to main...
git branch -M main

echo.
echo Pushing to GitHub...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [✓] Successfully pushed to GitHub!
    echo Repository URL: %repo_url%
) else (
    echo.
    echo [ERROR] Failed to push
    echo Common issues:
    echo - Repository URL is incorrect
    echo - Git credentials not configured
    echo - Remote already exists (remove with: git remote remove origin)
)

echo.
pause
