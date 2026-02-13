# Quick Start Guide

## 🚀 5-Minute Setup

### 1. Install Android Studio
Download from: https://developer.android.com/studio

### 2. Open Project
1. Launch Android Studio
2. Click "Open"
3. Select the `AIStudentAssistant` folder
4. Wait for Gradle sync

### 3. Get OpenAI API Key
1. Go to https://platform.openai.com/api-keys
2. Sign in or create account
3. Click "Create new secret key"
4. Copy the key (starts with "sk-...")

### 4. Run the App
1. Click the green "Run" button ▶️
2. Select an emulator or connected device
3. Wait for app to install

### 5. Configure API Key
1. When app opens, you'll see a dialog
2. Paste your OpenAI API key
3. Click "Save"

### 6. Start Learning!
1. Select a subject (Matematika, Ingliz tili, Fizika, Tarix)
2. Type your question
3. Tap "Javob olish"
4. Get your AI-powered answer!

## 📱 Building APK

### For Testing (Debug APK)
```bash
./gradlew assembleDebug
```
Output: `app/build/outputs/apk/debug/app-debug.apk`

### For Distribution (Release APK)
```bash
./gradlew assembleRelease
```
Output: `app/build/outputs/apk/release/app-release.apk`

## ⚠️ Common Issues

**"SDK not found"**
→ Create `local.properties` with: `sdk.dir=/path/to/Android/sdk`

**"Gradle sync failed"**
→ Check internet connection, click "Sync Project with Gradle Files"

**"API Error"**
→ Verify your OpenAI API key is correct and has credits

## 💡 Tips

- First-time Gradle sync takes 5-10 minutes
- Debug APK is larger than release APK
- Keep your API key private - never share it
- The app works on Android 7.0 (API 24) and above

## 📞 Need Help?

Check the full README.md for detailed documentation!
