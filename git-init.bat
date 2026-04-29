@echo off
REM Initialize Git Repository and prepare for GitHub

echo.
echo ========================================
echo   Git Repository Setup
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

REM Initialize git repository if not already done
if not exist .git (
    echo Initializing git repository...
    git init
    echo [✓] Git repository initialized
) else (
    echo [✓] Git repository already exists
)

echo.
echo Adding files to git...
git add .

echo.
echo Creating initial commit...
git commit -m "Initial commit: Shift Roster v5 with Docker setup" -m "- Latest roster version (V5_roster_dynamic.html)" -m "- Complete Docker and docker-compose configuration" -m "- Nginx configuration for static file serving" -m "- Windows batch scripts for easy management" -m "- Comprehensive README and documentation"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   [✓] Repository Ready!
    echo ========================================
    echo.
    echo Current branch:
    git branch
    echo.
    echo Commit history:
    git log --oneline -5
    echo.
    echo.
    echo NEXT STEPS - Upload to GitHub:
    echo.
    echo 1. Create a new repository on GitHub:
    echo    https://github.com/new
    echo.
    echo 2. After creating the repository, run one of these commands:
    echo.
    echo    For HTTPS:
    echo    git remote add origin https://github.com/YOUR_USERNAME/shift-roster.git
    echo    git branch -M main
    echo    git push -u origin main
    echo.
    echo    For SSH:
    echo    git remote add origin git@github.com:YOUR_USERNAME/shift-roster.git
    echo    git branch -M main
    echo    git push -u origin main
    echo.
    echo 3. Replace YOUR_USERNAME with your GitHub username
    echo.
) else (
    echo.
    echo [ERROR] Failed to create commit
    echo (This might be normal if nothing changed)
)

echo.
pause
