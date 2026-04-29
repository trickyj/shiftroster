@echo off
REM Automatic GitHub Push to trickyj/shiftroster

echo.
echo ========================================
echo   Pushing to GitHub
echo ========================================
echo.

REM Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed or not in PATH
    echo Please install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [✓] Git is installed
echo.

REM Initialize git if not already done
if not exist .git (
    echo Initializing git repository...
    git init
    echo [✓] Repository initialized
) else (
    echo [✓] Git repository already exists
)

echo.
echo Adding all files...
git add .

echo.
echo Creating initial commit...
git commit -m "Initial commit: Shift Roster v5 with Docker" -m "- Latest roster version (V5_roster_dynamic.html)" -m "- Complete Docker and docker-compose configuration" -m "- Nginx web server configuration" -m "- Windows batch scripts for easy management" -m "- Comprehensive README and documentation" -m "- Git configuration files"

echo.
echo Checking for existing remote...
git remote | find "origin" >nul
if %ERRORLEVEL% EQU 0 (
    echo [!] Remote origin already exists, removing...
    git remote remove origin
)

echo.
echo Adding GitHub repository...
git remote add origin https://github.com/trickyj/shiftroster.git

echo.
echo Setting branch to main...
git branch -M main

echo.
echo Pushing to GitHub (you may be asked for credentials)...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   [✓] Successfully pushed to GitHub!
    echo ========================================
    echo.
    echo Repository: https://github.com/trickyj/shiftroster
    echo.
    echo View your project online in a moment...
    timeout /t 3
    start https://github.com/trickyj/shiftroster
) else (
    echo.
    echo [ERROR] Failed to push to GitHub
    echo.
    echo Common solutions:
    echo - If asked for credentials, use your GitHub personal access token (PAT)
    echo   https://github.com/settings/tokens
    echo - Make sure SSH keys are configured for SSH URLs
    echo - Check your internet connection
    echo.
    echo For detailed help, run: git status
)

echo.
pause
