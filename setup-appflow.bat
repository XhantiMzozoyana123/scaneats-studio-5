@echo off
:: ScanEats Ionic Appflow Setup Script
:: This script helps you set up Ionic Appflow for free iOS builds

echo 🚀 ScanEats Ionic Appflow Setup
echo ================================
echo.

echo 📋 What is Ionic Appflow?
echo - FREE cloud builds (100/month on free tier)
echo - Native iOS builds without Mac
echo - Automatic code signing
echo - Live app updates
echo - Real device testing
echo.

echo 🎯 Setup Steps:
echo.

echo 1️⃣  Create Ionic Account (FREE)
echo    👉 Go to: https://dashboard.ionicframework.com/signup
echo    ✅ Sign up with GitHub (recommended)
echo.

echo 2️⃣  Create New App in Appflow
echo    👉 Click "New App" in Appflow dashboard
echo    ✅ Name: ScanEats
echo    ✅ Connect to this GitHub repository
echo.

echo 3️⃣  Configure iOS Build
echo    👉 Go to Build → iOS in Appflow
echo    ✅ Upload iOS certificates (or use Appflow's automatic signing)
echo    ✅ Set build type to "Development" for testing
echo.

echo 4️⃣  Trigger Your First Build
echo    👉 Push code to GitHub (automatic trigger)
echo    👉 Or manually trigger in Appflow dashboard
echo.

set /p continue="Ready to open Appflow dashboard? (y/N): "
if /i "%continue%"=="y" (
    echo 🌐 Opening Ionic Appflow...
    start https://dashboard.ionicframework.com/
    echo.
    echo 📖 After setup, your builds will be automatic!
    echo 💡 Every git push will trigger a new iOS build
) else (
    echo ❌ Setup cancelled
)

echo.
echo 📚 Helpful Links:
echo 🔗 Appflow Documentation: https://ionicframework.com/docs/appflow
echo 🔗 iOS Setup Guide: https://ionicframework.com/docs/appflow/package/ios
echo 🔗 Free Tier Limits: https://ionicframework.com/pricing/appflow
echo.

echo 💡 Pro Tips:
echo - Use development builds for testing (faster)
echo - Appflow can auto-generate certificates
echo - Install Ionic View app for easy testing
echo - Connect TestFlight for beta distribution
echo.

echo 🎉 Once set up, just push code and get your IPA automatically!
pause
