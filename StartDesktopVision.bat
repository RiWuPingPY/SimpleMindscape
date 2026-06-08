@echo off
cd /d "%~dp0"
echo ============================================
echo   Mindscape - Desktop Launcher
echo ============================================
echo.
where node >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Node.js not found. Please install it from https://nodejs.org
    echo Then run this script again.
    pause
    exit /b 1
)
if not exist "node_modules\electron" (
    echo [First run] Installing Electron dependencies, please wait...
    echo (Only needed the first time.)
    call npm install
    if errorlevel 1 (
        echo [ERROR] Dependency install failed. Check your network and retry.
        pause
        exit /b 1
    )
)
echo Starting Mindscape...
call npm start
