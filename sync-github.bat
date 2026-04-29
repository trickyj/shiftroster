@echo off
REM Complete GitHub Sync: Pull remote, merge changes, then push

echo.
echo ========================================
echo   Complete GitHub Sync Process
echo ========================================
echo.

REM Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed or not in PATH
    pause
    exit /b 1
)

echo [✓] Git installed
echo.

REM Initialize if needed
if not exist .git (
    echo Step 1/4: Initializing git repository...
    git init
) else (
    echo Step 1/4: [✓] Repository exists
)

echo.
echo Step 2/4: Checking remote...
git remote | find "origin" >nul
if %ERRORLEVEL% NEQ 0 (
    git remote add origin https://github.com/trickyj/shiftroster.git
    echo [✓] Remote added
) else (
    echo [✓] Remote configured
)

echo.
echo Step 3/4: Pulling remote changes...
git pull origin main --allow-unrelated-histories

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [!] Note: Pull may have conflicts. Review status below.
)

echo.
echo Step 4/4: Adding local files...
git add .

echo.
echo Creating commit...
git commit -m "Merge: Shift Roster v5 with Docker + GitHub template" -m "- Pulled template from GitHub" -m "- Added Shift Roster v5 files" -m "- Added Docker configuration" -m "- Added batch management scripts" -m "- Added comprehensive documentation"

if %ERRORLEVEL% NEQ 0 (
    echo [!] No changes to commit (everything up to date)
)

echo.
echo Setting branch to main...
git branch -M main

echo.
echo ========================================
echo   Current Status
echo ========================================
git status

echo.
echo.
echo Ready to push! Run one of these:
echo.
echo   Option 1: push-github.bat (automatic)
echo   Option 2: git push origin main (manual)
echo.
pause
