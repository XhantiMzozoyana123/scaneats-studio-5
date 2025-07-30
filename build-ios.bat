@echo off
:: ScanEats iOS Build Helper Script (Windows)
:: This script helps you trigger iOS builds via GitHub Actions

echo 🍎 ScanEats iOS Build Helper
echo ================================
echo.

:: Check if we're in a git repository
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo ❌ Error: Not in a git repository
    exit /b 1
)

:: Get current branch
for /f %%i in ('git rev-parse --abbrev-ref HEAD') do set BRANCH=%%i
echo 📍 Current branch: %BRANCH%
echo.

echo Available build options:
echo 1. 🏗️  Trigger development build (current changes)
echo 2. 🚀 Create production release (new tag)
echo 3. 🆓 FREE: Trigger open-source build (no signing required)
echo 4. 📋 Check build status
echo 5. 📥 Download latest IPA
echo 6. 📖 Show installation guide
echo.

set /p choice="Choose an option (1-6): "

if "%choice%"=="1" (
    echo.
    echo 🏗️ Triggering development build...
    echo This will push your current changes and trigger a build.
    echo.
    set /p confirm="Continue? (y/N): "
    if /i "%confirm%"=="y" (
        git add .
        git commit -m "Trigger iOS build - %date% %time%"
        git push origin %BRANCH%
        echo ✅ Changes pushed! Check GitHub Actions for build progress.
        for /f %%i in ('git config --get remote.origin.url') do set REPO_URL=%%i
        echo 🔗 GitHub Actions URL will be displayed after push
    ) else (
        echo ❌ Build cancelled
    )
) else if "%choice%"=="2" (
    echo.
    echo 🚀 Creating production release...
    echo Current version in package.json:
    node -p "'v' + require('./package.json').version"
    echo.
    set /p version="Enter new version (e.g., v1.0.1): "
    git tag %version%
    git push origin %version%
    echo ✅ Tag %version% created and pushed!
    echo 🏗️ Production build will start automatically.
    echo 🔗 Check GitHub Actions for progress
) else if "%choice%"=="3" (
    echo.
    echo 🆓 Triggering FREE open-source build...
    echo This uses GitHub Actions with no signing requirements!
    echo.
    set /p confirm="Continue with free build? (y/N): "
    if /i "%confirm%"=="y" (
        git add .
        git commit -m "Trigger FREE iOS build - %date% %time%"
        git push origin %BRANCH%
        echo ✅ Free build triggered!
        echo 🎉 This will create an unsigned IPA you can install with AltStore/Sideloadly
        echo 📖 Check docs\ios-installation-guide.md for installation instructions
        echo 🔗 Monitor progress in GitHub Actions
    ) else (
        echo ❌ Build cancelled
    )
) else if "%choice%"=="4" (
    echo.
    echo 📋 Check GitHub Actions in your browser:
    echo Go to your repository on GitHub and click the "Actions" tab
) else if "%choice%"=="5" (
    echo.
    echo 📥 To download IPAs:
    echo 1. Go to GitHub Actions in your repository
    echo 2. Click on a completed build
    echo 3. Scroll down to 'Artifacts' section
    echo 4. Download 'ScanEats-iOS-Unsigned' or similar
) else if "%choice%"=="6" (
    echo.
    echo 📖 Opening installation guide...
    start docs\ios-installation-guide.md
    echo 💡 The guide explains how to install your unsigned IPA for FREE!
) else (
    echo ❌ Invalid option
)

echo.
echo 🎉 Done!
pause
