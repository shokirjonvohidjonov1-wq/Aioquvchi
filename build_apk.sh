#!/bin/bash

echo "=========================================="
echo "AI O'quvchi Yordamchisi - APK Builder"
echo "=========================================="
echo ""

# Check if gradlew exists
if [ ! -f "./gradlew" ]; then
    echo "❌ Error: gradlew not found!"
    echo "Please run this script from the project root directory."
    exit 1
fi

# Make gradlew executable
chmod +x ./gradlew

echo "Building Debug APK..."
echo ""

./gradlew assembleDebug

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✅ Build Successful!"
    echo "=========================================="
    echo ""
    echo "📱 APK Location:"
    echo "app/build/outputs/apk/debug/app-debug.apk"
    echo ""
    echo "📊 APK Size:"
    ls -lh app/build/outputs/apk/debug/app-debug.apk 2>/dev/null | awk '{print $5}'
    echo ""
    echo "🚀 To install on device:"
    echo "adb install app/build/outputs/apk/debug/app-debug.apk"
    echo ""
else
    echo ""
    echo "=========================================="
    echo "❌ Build Failed!"
    echo "=========================================="
    echo ""
    echo "Please check the error messages above."
    echo "Common solutions:"
    echo "  1. Ensure Android SDK is properly configured"
    echo "  2. Create local.properties with sdk.dir"
    echo "  3. Check internet connection for dependencies"
    echo ""
    exit 1
fi
