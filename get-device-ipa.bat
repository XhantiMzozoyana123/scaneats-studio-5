@echo off
:: ScanEats Device Build Helper - Get IPA for Real iPhone/iPad
:: No Mac or Xcode needed!

echo 📱 ScanEats Device Build Helper
echo ================================
echo.

echo 🎉 Your simulator build was successful!
echo Now let's create a DEVICE build for your iPhone/iPad
echo.

echo 📋 What you'll get:
echo ✅ IPA file that installs on real devices
echo ✅ Works with AltStore, Sideloadly, 3uTools
echo ✅ No Mac or Xcode required
echo ✅ Install directly on Windows
echo.

echo 🚀 Step 1: Open Appflow Build Dashboard
set /p open="Open Appflow dashboard to create device build? (y/N): "
if /i "%open%"=="y" (
    echo 🌐 Opening Appflow...
    start https://dashboard.ionicframework.com/apps/e0d0cbc9/build/builds
    echo.
    echo 📋 In the dashboard:
    echo 1. Click "New Build"
    echo 2. Platform: iOS
    echo 3. Build Type: "development" (NOT simulator)
    echo 4. Signing: "Automatic"
    echo 5. Click "Build"
    echo.
    echo ⏱️ Build takes ~3-5 minutes
    echo 📥 Download IPA when complete
)

echo.
echo 📱 Step 2: Install IPA Tools (Choose one)
echo.

echo 🔧 Option A: AltStore (Recommended)
set /p altstore="Download AltStore? (y/N): "
if /i "%altstore%"=="y" (
    start https://altstore.io/
    echo ✅ AltStore download started
)

echo.
echo 🔧 Option B: Sideloadly  
set /p sideloadly="Download Sideloadly? (y/N): "
if /i "%sideloadly%"=="y" (
    start https://sideloadly.io/
    echo ✅ Sideloadly download started
)

echo.
echo 🔧 Option C: 3uTools
set /p threetools="Download 3uTools? (y/N): "
if /i "%threetools%"=="y" (
    start https://www.3u.com/
    echo ✅ 3uTools download started
)

echo.
echo 📖 Step 3: Installation Guide
set /p guide="Open installation guide? (y/N): "
if /i "%guide%"=="y" (
    start docs\build-success-guide.md
    echo ✅ Guide opened
)

echo.
echo 🎯 Summary:
echo 1. ✅ Create device build in Appflow dashboard
echo 2. ✅ Download installation tool (AltStore recommended)
echo 3. ✅ Install IPA on your iPhone/iPad
echo 4. ✅ Enjoy your ScanEats app!
echo.

echo 💡 Pro Tip: Development builds work great for testing!
echo 📞 Need help? Check the installation guide
echo.

pause
