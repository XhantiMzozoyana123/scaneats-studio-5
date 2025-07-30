#!/bin/bash

# ScanEats iOS Build Helper Script
# This script helps you trigger iOS builds via GitHub Actions

echo "🍎 ScanEats iOS Build Helper"
echo "================================"
echo ""

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Not in a git repository"
    exit 1
fi

# Get current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "📍 Current branch: $BRANCH"
echo ""

echo "Available build options:"
echo "1. 🏗️  Trigger development build (current changes)"
echo "2. 🚀 Create production release (new tag)"
echo "3. 📋 Check build status"
echo "4. 📥 Download latest IPA"
echo ""

read -p "Choose an option (1-4): " choice

case $choice in
    1)
        echo ""
        echo "🏗️ Triggering development build..."
        echo "This will push your current changes and trigger a build."
        echo ""
        read -p "Continue? (y/N): " confirm
        if [[ $confirm == [yY] ]]; then
            git add .
            git commit -m "Trigger iOS build - $(date)"
            git push origin $BRANCH
            echo "✅ Changes pushed! Check GitHub Actions for build progress."
            echo "🔗 https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\(.*\)\.git/\1/')/actions"
        else
            echo "❌ Build cancelled"
        fi
        ;;
    2)
        echo ""
        echo "🚀 Creating production release..."
        echo "Current version in package.json:"
        node -p "'v' + require('./package.json').version"
        echo ""
        read -p "Enter new version (e.g., v1.0.1): " version
        if [[ $version =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            git tag $version
            git push origin $version
            echo "✅ Tag $version created and pushed!"
            echo "🏗️ Production build will start automatically."
            echo "🔗 https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\(.*\)\.git/\1/')/actions"
        else
            echo "❌ Invalid version format. Use format: v1.0.0"
        fi
        ;;
    3)
        echo ""
        echo "📋 Opening GitHub Actions in browser..."
        open "https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\(.*\)\.git/\1/')/actions"
        ;;
    4)
        echo ""
        echo "📥 To download IPAs:"
        echo "1. Go to GitHub Actions: https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\(.*\)\.git/\1/')/actions"
        echo "2. Click on a completed build"
        echo "3. Scroll down to 'Artifacts' section"
        echo "4. Download 'ScanEats-iOS-Development' or similar"
        ;;
    *)
        echo "❌ Invalid option"
        ;;
esac

echo ""
echo "🎉 Done!"
