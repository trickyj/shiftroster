@echo off
REM Pull remote changes from GitHub and merge

echo.
echo ========================================
echo   Pulling Remote Changes
echo ========================================
echo.

REM Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed or not in PATH
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
echo Checking for existing remote...
git remote | find "origin" >nul
if %ERRORLEVEL% NEQ 0 (
    echo Adding GitHub repository...
    git remote add origin https://github.com/trickyj/shiftroster.git
) else (
    echo [✓] Remote origin already configured
)

echo.
echo Pulling latest changes from GitHub...
git pull origin main --allow-unrelated-histories

if %ERRORLEVEL% EQU 0 (
    echo [✓] Successfully pulled remote changes
) else (
    echo [!] Pull completed (may have conflicts to resolve)
)

echo.
echo Current repository status:
git status

echo.
pause
