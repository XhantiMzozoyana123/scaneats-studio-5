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
echo 4. ⚡ IONIC APPFLOW: Professional cloud builds (FREE tier)
echo 5. 🏪 APP STORE: Official iOS App Store submission
echo 6. 📋 Check build status
echo 7. 📥 Download latest IPA
echo 8. 📖 Show installation guide
echo.

set /p choice="Choose an option (1-8): "

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
    echo ⚡ Setting up Ionic Appflow...
    echo This is the BEST option for professional iOS builds!
    echo.
    echo 🎉 Benefits:
    echo - 100 FREE builds per month
    echo - Native iOS builds in the cloud
    echo - Automatic code signing
    echo - No Mac required
    echo - Professional certificates handling
    echo.
    set /p setup="Run Appflow setup guide? (y/N): "
    if /i "%setup%"=="y" (
        start setup-appflow.bat
        echo ✅ Setup guide opened!
        echo 💡 After setup, every git push triggers a build automatically
    ) else (
        echo 💡 Run setup-appflow.bat anytime to get started
    )
) else if "%choice%"=="5" (
    echo.
    echo 🏪 App Store Submission Setup
    echo ==============================
    echo.
    echo 📋 Requirements for App Store:
    echo ✅ Apple Developer Account ($99/year)
    echo ✅ App icons and screenshots
    echo ✅ App Store Connect listing
    echo ✅ Distribution certificates
    echo.
    echo 💰 Investment Required: $99 USD/year
    echo ⏱️ Timeline: 6-14 days total
    echo 🎯 Result: Your app on the official App Store!
    echo.
    set /p appstore="Open App Store submission guide? (y/N): "
    if /i "%appstore%"=="y" (
        start docs\app-store-submission-guide.md
        echo ✅ App Store guide opened!
        echo.
        echo 🚀 Next steps:
        echo 1. Get Apple Developer account
        echo 2. Create app assets (icons, screenshots)
        echo 3. Configure Appflow for app-store builds
        echo 4. Submit to App Store Connect
    ) else (
        echo 💡 Check docs\app-store-submission-guide.md anytime
    )
) else if "%choice%"=="6" (
    echo.
    echo 📋 Check GitHub Actions in your browser:
    echo Go to your repository on GitHub and click the "Actions" tab
    echo.
    echo 📱 Or check Ionic Appflow builds:
    echo Go to https://dashboard.ionicframework.com/
) else if "%choice%"=="6" (
    echo.
    echo 📥 To download IPAs:
    echo.
    echo 📱 From Ionic Appflow (RECOMMENDED):
    echo 1. Go to https://dashboard.ionicframework.com/
    echo 2. Open your ScanEats app
    echo 3. Go to Build section
    echo 4. Download completed builds
    echo.
    echo 🔧 From GitHub Actions:
    echo 1. Go to GitHub Actions in your repository
    echo 2. Click on a completed build
    echo 3. Scroll down to 'Artifacts' section
    echo 4. Download 'ScanEats-iOS-Unsigned' or similar
) else if "%choice%"=="8" (
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
