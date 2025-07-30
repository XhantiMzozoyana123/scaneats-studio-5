# ScanEats Mobile App

This project has been successfully converted from a Next.js web application to a mobile app using Capacitor.

## 🚀 Quick Start

### Prerequisites
- Node.js (v18 or higher)
- Android Studio (for Android development)
- Xcode (for iOS development, macOS only)

### Building for Mobile

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Build the web app:**
   ```bash
   npm run build
   ```

3. **Sync with Capacitor:**
   ```bash
   npm run cap:sync
   ```

4. **Open in native IDE:**
   
   **For Android:**
   ```bash
   npm run cap:android
   ```
   
   **For iOS:**
   ```bash
   npm run cap:ios
   ```

## 📱 Mobile Features

The mobile app includes:

- ✅ **Camera Integration** - Take photos of food using device camera
- ✅ **Status Bar Management** - Native status bar styling
- ✅ **Splash Screen** - Custom splash screen with branding
- ✅ **Haptic Feedback** - Native haptic feedback for interactions
- ✅ **Keyboard Management** - Smart keyboard handling
- ✅ **Back Button Handling** - Native Android back button support
- ✅ **Device Information** - Access to device details
- ✅ **File System Access** - Store and retrieve files on device

## 🛠 Development Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run cap:build` - Build and sync with Capacitor
- `npm run cap:sync` - Sync web assets with native platforms
- `npm run cap:android` - Open Android project in Android Studio
- `npm run cap:ios` - Open iOS project in Xcode

## 📁 Project Structure

```
├── android/          # Native Android project
├── ios/              # Native iOS project  
├── src/
│   ├── components/
│   │   ├── mobile-layout.tsx      # Mobile-specific layout
│   │   ├── mobile-camera.tsx      # Camera component
│   │   └── ...
│   ├── lib/
│   │   ├── mobile-utils.ts        # Mobile utility functions
│   │   ├── mobile-food-scan.ts    # Mobile-compatible AI functions
│   │   └── ...
│   └── app/           # Next.js app pages
├── capacitor.config.ts # Capacitor configuration
└── out/              # Built web assets (used by mobile apps)
```

## 🔧 Configuration

### Capacitor Config
The `capacitor.config.ts` file contains:
- App ID: `com.scaneats.app`
- App Name: `ScanEats`
- Web directory: `out` (Next.js export output)
- Splash screen configuration
- Status bar settings

### Mobile-Specific Components

1. **MobileLayout** (`src/components/mobile-layout.tsx`)
   - Handles mobile-specific initialization
   - Manages status bar, splash screen, and keyboard
   - Handles Android back button

2. **MobileCamera** (`src/components/mobile-camera.tsx`)
   - Camera capture functionality
   - Gallery selection
   - Image handling for food scanning

3. **Mobile Utils** (`src/lib/mobile-utils.ts`)
   - Device detection utilities
   - Platform-specific functions

## 🎨 Styling for Mobile

The app uses Tailwind CSS with mobile-responsive design:
- Touch-friendly button sizes
- Mobile-optimized navigation
- Responsive layouts
- Native-feeling UI components

## 🔒 Permissions

The mobile app requires these permissions:
- **Camera** - For food photo capture
- **Storage** - For saving and accessing images
- **Internet** - For API calls (when available)

## 📦 Building for Production

### Android APK/AAB
1. Open in Android Studio: `npm run cap:android`
2. Build > Generate Signed Bundle/APK
3. Follow Android Studio's signing process

### iOS App Store
1. Open in Xcode: `npm run cap:ios`
2. Product > Archive
3. Follow Xcode's distribution process

## 🚨 Important Notes

- **AI Features**: Currently using mock data for mobile builds. Integrate with a mobile-compatible AI service for production.
- **Authentication**: Google OAuth is temporarily disabled for mobile builds.
- **Server Actions**: Disabled for static export compatibility.

## 🔄 Updating the Mobile App

When you make changes to your web app:

1. Build the updated web app: `npm run build`
2. Sync with mobile platforms: `npm run cap:sync`
3. Test in the native IDEs

## 📝 Next Steps

To make this production-ready:

1. **Integrate Mobile AI Service**: Replace mock functions in `mobile-food-scan.ts`
2. **Add Real Authentication**: Implement mobile-compatible auth
3. **Configure App Icons**: Add proper app icons in `android/` and `ios/` folders
4. **Set Up Push Notifications**: Add push notification capabilities
5. **App Store Preparation**: Configure metadata, screenshots, descriptions

## 🆘 Troubleshooting

**Build Issues:**
- Ensure all dependencies are installed
- Check that Android Studio/Xcode are properly set up
- Verify capacitor plugins are compatible

**Camera Not Working:**
- Check device permissions
- Ensure running on physical device (not simulator)
- Verify camera plugin is properly installed

**App Won't Start:**
- Check capacitor.config.ts configuration
- Ensure webDir points to correct build output
- Verify all required plugins are installed
