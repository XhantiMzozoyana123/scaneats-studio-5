@echo off
:: ScanEats XCARCHIVE to IPA Converter
:: Converts your Appflow XCARCHIVE to installable IPA using GitHub Actions

echo 📦 ScanEats XCARCHIVE to IPA Converter
echo ========================================
echo.

echo 🎯 This tool converts your Appflow XCARCHIVE to IPA using GitHub Actions
echo ✅ Free macOS runner (no cost to you)
echo ✅ Supports all export types (development, app-store, ad-hoc)
echo ✅ Automatic signing and export
echo.

echo 📋 Prerequisites:
echo 1. Download XCARCHIVE from your Appflow build
echo 2. Place it in this repository folder
echo 3. Run this script to trigger conversion
echo.

:: Check if we're in a git repository
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo ❌ Error: Not in a git repository
    pause
    exit /b 1
)

echo 🔍 Looking for XCARCHIVE files...
for %%f in (*.xcarchive) do (
    echo ✅ Found: %%f
    set FOUND_ARCHIVE=%%f
)

for %%f in (*.zip) do (
    echo 🗜️ Found ZIP: %%f (might contain XCARCHIVE)
)

echo.
if not defined FOUND_ARCHIVE (
    echo 📥 No XCARCHIVE found in current directory
    echo.
    echo 💡 Steps to get your XCARCHIVE:
    echo 1. Go to Appflow: https://dashboard.ionicframework.com/apps/e0d0cbc9/build/builds
    echo 2. Open your completed build
    echo 3. Download the XCARCHIVE file
    echo 4. Place it in this folder: %CD%
    echo 5. Run this script again
    echo.
    set /p openAppflow="Open Appflow to download XCARCHIVE? (y/N): "
    if /i "%openAppflow%"=="y" (
        start https://dashboard.ionicframework.com/apps/e0d0cbc9/build/builds
        echo ✅ Appflow opened - download your XCARCHIVE
    )
    pause
    exit /b 1
)

echo ✅ XCARCHIVE found: %FOUND_ARCHIVE%
echo.

echo 🎯 Choose export method:
echo 1. 📱 Development (for testing on your devices)
echo 2. 🔄 Ad-hoc (for beta testing with specific devices)  
echo 3. 🏪 App Store (for App Store submission)
echo 4. 🏢 Enterprise (for internal distribution)
echo.

set /p choice="Choose export method (1-4): "

if "%choice%"=="1" (
    set EXPORT_METHOD=development
    set DESCRIPTION=Development build for testing
) else if "%choice%"=="2" (
    set EXPORT_METHOD=ad-hoc
    set DESCRIPTION=Ad-hoc build for beta testing
) else if "%choice%"=="3" (
    set EXPORT_METHOD=app-store
    set DESCRIPTION=App Store build for submission
) else if "%choice%"=="4" (
    set EXPORT_METHOD=enterprise
    set DESCRIPTION=Enterprise build for internal use
) else (
    echo ❌ Invalid choice
    pause
    exit /b 1
)

echo.
echo 📦 Selected: %EXPORT_METHOD% (%DESCRIPTION%)
echo.

:: Get archive name without extension
for %%f in ("%FOUND_ARCHIVE%") do set ARCHIVE_NAME=%%~nf

echo 🚀 Ready to convert XCARCHIVE to IPA!
echo Archive: %ARCHIVE_NAME%
echo Method: %EXPORT_METHOD%
echo.

set /p confirm="Commit XCARCHIVE and trigger GitHub Actions? (y/N): "
if /i not "%confirm%"=="y" (
    echo ❌ Conversion cancelled
    pause
    exit /b 1
)

echo.
echo 📤 Adding XCARCHIVE to repository...
git add "%FOUND_ARCHIVE%"
git add .github/workflows/export-ipa.yml

echo 💾 Committing files...
git commit -m "📦 Add XCARCHIVE for IPA conversion - %EXPORT_METHOD% build"

echo 🚀 Pushing to GitHub...
git push origin master

echo.
echo ✅ XCARCHIVE uploaded to GitHub!
echo.
echo 🔧 Now triggering GitHub Actions workflow...
echo.

:: Get repository URL for Actions
for /f %%i in ('git config --get remote.origin.url') do set REPO_URL=%%i

echo 🌐 Opening GitHub Actions to trigger workflow...
echo.
echo 📋 Manual steps:
echo 1. Go to Actions tab in your repository
echo 2. Click "Export IPA from XCARCHIVE" workflow
echo 3. Click "Run workflow"
echo 4. Set archive name: %ARCHIVE_NAME%
echo 5. Set export method: %EXPORT_METHOD%
echo 6. Click "Run workflow" button
echo.

:: Try to open GitHub Actions
set /p openActions="Open GitHub Actions page? (y/N): "
if /i "%openActions%"=="y" (
    start https://github.com/XhantiMzozoyana123/scaneats-studio-5/actions/workflows/export-ipa.yml
    echo ✅ GitHub Actions opened
)

echo.
echo ⏱️ Conversion takes ~5-10 minutes
echo 📥 Download IPA from the Artifacts section when complete
echo.

echo 🎉 Your IPA will be ready shortly!
echo 💡 The workflow handles all the Xcode complexity for you
pause
