# 📦 XCARCHIVE to IPA Conversion Guide

## 🎯 **What This Does**

Converts your **XCARCHIVE** file from Ionic Appflow into a proper **IPA** file that you can:
- Install on devices (development/ad-hoc)
- Submit to App Store (app-store)
- Distribute internally (enterprise)

## 🆓 **Why Use GitHub Actions?**

- ✅ **Completely FREE** (uses GitHub's macOS runners)
- ✅ **No Mac required** (runs in the cloud)
- ✅ **Automatic Xcode handling** (latest version always)
- ✅ **Professional signing** (same as local Xcode)
- ✅ **Multiple export types** (development, app-store, etc.)

## 🚀 **Quick Start**

### **Step 1: Get Your XCARCHIVE**
1. Go to [Appflow Builds](https://dashboard.ionicframework.com/apps/e0d0cbc9/build/builds)
2. Click on your completed build
3. Download the **XCARCHIVE** file
4. Save it to your project folder

### **Step 2: Run Converter**
```bash
# Simply run this script
.\convert-xcarchive-to-ipa.bat
```

### **Step 3: Choose Export Type**
- **Development**: Testing on your registered devices
- **Ad-hoc**: Beta testing with specific device UDIDs
- **App Store**: Official App Store submission
- **Enterprise**: Internal company distribution

### **Step 4: Download IPA**
- GitHub Actions runs automatically (~5-10 minutes)
- Download IPA from **Artifacts** section
- Install or submit as needed!

## 🔧 **Export Types Explained**

| Type | Use Case | Signing | Installation |
|------|----------|---------|--------------|
| **Development** | Testing on your devices | Development cert | Xcode, AltStore, Sideloadly |
| **Ad-hoc** | Beta testing (limited devices) | Distribution cert | TestFlight alternative |
| **App Store** | Official App Store | Distribution cert | App Store Connect |
| **Enterprise** | Internal company apps | Enterprise cert | Internal distribution |

## 📋 **What The Workflow Does**

1. ✅ **Sets up macOS environment** with latest Xcode
2. ✅ **Extracts your XCARCHIVE** (handles zipped files too)
3. ✅ **Creates ExportOptions.plist** (export configuration)
4. ✅ **Runs xcodebuild -exportArchive** (converts to IPA)
5. ✅ **Uploads IPA as artifact** (easy download)
6. ✅ **Creates release** (for app-store builds)

## 🎯 **File Structure**

```
your-project/
├── YourApp.xcarchive          # From Appflow
├── convert-xcarchive-to-ipa.bat  # Converter script
├── .github/workflows/
│   └── export-ipa.yml         # GitHub Actions workflow
└── output/                    # Generated IPAs
    ├── YourApp.ipa           # Your final IPA!
    └── logs/                 # Build logs
```

## 💡 **Pro Tips**

### **For App Store Submission:**
1. Use **"app-store"** export method
2. Ensure you have Distribution Certificate
3. Upload IPA to App Store Connect
4. Configure app metadata and submit for review

### **For Device Testing:**
1. Use **"development"** export method  
2. Install with AltStore, Sideloadly, or Xcode
3. Perfect for testing before App Store submission

### **For Beta Testing:**
1. Use **"ad-hoc"** export method
2. Register tester device UDIDs in Apple Developer
3. Great alternative to TestFlight

## 🚨 **Troubleshooting**

### **"No XCARCHIVE found"**
- Make sure you downloaded the XCARCHIVE from Appflow
- Place it in the same folder as the script
- File should end with `.xcarchive`

### **"Export failed"**
- Check you have proper certificates in Apple Developer
- Verify Bundle ID matches your app configuration
- Check GitHub Actions logs for specific error

### **"IPA won't install"**
- Development builds: Register device UDID in Apple Developer
- App Store builds: Use App Store Connect, not direct install
- Ad-hoc builds: Add device UDID to provisioning profile

## 🎉 **Success!**

Once complete, you'll have a professional IPA file ready for:
- ✅ Device installation
- ✅ App Store submission  
- ✅ Beta distribution
- ✅ Enterprise deployment

---

**This solution gives you the power of Xcode without owning a Mac!** 🚀
