# 📱 GitHub Actions iOS Build Setup

This repository is configured to automatically build iOS IPA files using GitHub Actions with macOS runners. No local Xcode installation required!

## 🚀 Available Workflows

### 1. **Development Build** (`build-ios-dev.yml`)
- ✅ **Trigger**: Push to main/master, or manual dispatch
- ✅ **Purpose**: Quick testing builds (unsigned)
- ✅ **Output**: Development IPA for testing
- ✅ **Requirements**: None (no signing certificates needed)

### 2. **Production Build** (`build-ios-production.yml`)
- 🔐 **Trigger**: Git tags (v1.0.0) or manual dispatch
- 📦 **Purpose**: App Store or Ad Hoc distribution
- 📝 **Output**: Signed IPA ready for distribution
- 🔑 **Requirements**: Apple Developer certificates and secrets

### 3. **Basic Build** (`build-ios.yml`)
- 🛠️ **Trigger**: Push or PR to main/master
- 🧪 **Purpose**: CI/CD testing and validation
- 📁 **Output**: Basic IPA for testing

## 🎯 How to Get Your IPA File

### Option 1: Quick Development Build (Recommended for Testing)

1. **Go to GitHub Actions tab** in your repository
2. **Click "Build Development IPA (No Signing)"**
3. **Click "Run workflow"** → **"Run workflow"**
4. **Wait 10-15 minutes** for the build to complete
5. **Download the artifact** named `ScanEats-iOS-Development`

### Option 2: Automatic Build on Push

1. **Make any change** to your code
2. **Push to master/main branch**
3. **GitHub will automatically build** your IPA
4. **Check the Actions tab** for completion
5. **Download from artifacts** section

### Option 3: Production Build (Requires Apple Developer Account)

1. **Set up signing certificates** (see below)
2. **Create a git tag**: `git tag v1.0.0 && git push origin v1.0.0`
3. **Or run manually** from Actions tab
4. **Get production-ready IPA**

## 🔧 Setting Up Production Builds (Optional)

For App Store distribution, you'll need to add these secrets to your GitHub repository:

### Required Secrets

Go to **Settings** → **Secrets and variables** → **Actions** and add:

```
BUILD_CERTIFICATE_BASE64     = [Your .p12 certificate in base64]
P12_PASSWORD                 = [Your certificate password]
BUILD_PROVISION_PROFILE_BASE64 = [Your .mobileprovision in base64]
KEYCHAIN_PASSWORD           = [Any secure password]
APPLE_TEAM_ID              = [Your Apple Team ID]
```

### How to Get These Values

1. **Export Certificate from Xcode**:
   ```bash
   # Convert .p12 to base64
   base64 -i YourCertificate.p12 | pbcopy
   ```

2. **Export Provisioning Profile**:
   ```bash
   # Convert .mobileprovision to base64
   base64 -i YourProfile.mobileprovision | pbcopy
   ```

3. **Find Team ID**: Apple Developer Console → Membership

## 📦 What You Get

After a successful build, you'll find these artifacts:

```
ScanEats-iOS-Development/
├── ScanEats-Development-Unsigned.ipa  # Main IPA file
├── App.app/                           # iOS app bundle
└── build-log.txt                      # Build information
```

## 🎉 Quick Start

1. **Push your code** to the repository
2. **Go to GitHub Actions** tab
3. **Run "Build Development IPA"** workflow
4. **Wait for completion** (≈10-15 minutes)
5. **Download your IPA** from artifacts

## 📱 Installing Your IPA

### For Testing on Device:
1. **Use TestFlight** (if you have Apple Developer account)
2. **Use AltStore** or similar tools
3. **Use Xcode** to install directly

### For Distribution:
1. **Upload to App Store Connect** (production builds)
2. **Distribute via enterprise tools** (if applicable)
3. **Share via TestFlight** (beta testing)

## 🔍 Troubleshooting

### Build Fails?
- Check the **Actions logs** for detailed error messages
- Ensure **all dependencies** are in `package.json`
- Verify **Capacitor configuration** is correct

### IPA Not Working?
- **Development IPAs** are unsigned (for testing only)
- **Production builds** require proper signing certificates
- **Simulator builds** won't work on real devices

### Need Signed IPA?
- Set up **Apple Developer account**
- Configure **signing certificates** (see production setup above)
- Use **production workflow**

## 🚨 Important Notes

- **Free GitHub accounts** get 2000 minutes/month of macOS runners
- **Each build takes** ≈10-15 minutes
- **Development IPAs** are unsigned (testing only)
- **Production IPAs** require Apple Developer certificates
- **Builds run automatically** on code changes

## 📞 Support

If builds fail:
1. Check the **Actions logs** tab
2. Look for **red error messages**
3. Common issues:
   - Missing dependencies
   - Capacitor sync errors
   - iOS configuration problems

---

**🎉 You're all set!** Your iOS app will be built automatically in the cloud. No Xcode required on your machine!
