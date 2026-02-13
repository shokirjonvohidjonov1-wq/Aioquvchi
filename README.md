# AI O'quvchi Yordamchisi (AI Student Assistant)

A modern, production-ready Android application that demonstrates the role of artificial intelligence in education. This app connects to OpenAI's GPT-4o-mini API to provide intelligent educational assistance to students across multiple subjects.

## Features

✨ **Modern Material 3 Design**
- Beautiful, responsive UI following Material Design 3 guidelines
- Dark mode support
- Smooth animations and transitions

🎓 **Multi-Subject Support**
- Matematika (Mathematics)
- Ingliz tili (English)
- Fizika (Physics)
- Tarix (History)

💬 **Interactive Chat Interface**
- Real-time AI responses
- Chat history with RecyclerView
- Copy answers to clipboard
- Clear chat functionality

🔒 **Secure API Key Storage**
- Encrypted SharedPreferences using Android Security Crypto library
- API key never exposed in code
- Secure settings dialog

🏗️ **Clean Architecture**
- MVVM architecture pattern
- Repository pattern for data management
- Coroutines for asynchronous operations
- ViewBinding for type-safe view access

## Tech Stack

- **Language**: Kotlin
- **Min SDK**: 24 (Android 7.0)
- **Target SDK**: 34 (Android 14)
- **Architecture**: MVVM
- **Network**: Retrofit 2.9.0 + OkHttp
- **Async**: Kotlin Coroutines
- **UI**: Material 3 Components, ViewBinding
- **Security**: AndroidX Security Crypto
- **Dependency Injection**: Manual DI (can be upgraded to Hilt/Dagger)

## Prerequisites

Before building the app, ensure you have:

1. **Android Studio** (latest stable version - Hedgehog 2023.1.1 or newer)
2. **JDK 17** or higher
3. **Android SDK** with the following:
   - Android SDK Platform 34
   - Android SDK Build-Tools 34.0.0
4. **OpenAI API Key** (get one from https://platform.openai.com/api-keys)

## Installation & Setup

### Step 1: Clone or Download the Project

```bash
# If using git
git clone <repository-url>
cd AIStudentAssistant

# Or extract the ZIP file
unzip AIStudentAssistant.zip
cd AIStudentAssistant
```

### Step 2: Configure Android SDK Path

Create a `local.properties` file in the project root:

```properties
sdk.dir=/path/to/your/Android/sdk
```

**Example paths:**
- **Windows**: `C:\\Users\\YourName\\AppData\\Local\\Android\\Sdk`
- **Mac**: `/Users/YourName/Library/Android/sdk`
- **Linux**: `/home/YourName/Android/Sdk`

Or let Android Studio create this file automatically when you open the project.

### Step 3: Open in Android Studio

1. Launch Android Studio
2. Click "Open" or "Open an Existing Project"
3. Navigate to the `AIStudentAssistant` folder
4. Click "OK"
5. Wait for Gradle sync to complete

### Step 4: Build the Project

**Option A: Using Android Studio**
1. Click `Build` → `Make Project` (Ctrl+F9 / Cmd+F9)
2. Wait for the build to complete

**Option B: Using Command Line**
```bash
# On macOS/Linux
./gradlew build

# On Windows
gradlew.bat build
```

### Step 5: Run on Device/Emulator

**Run on Emulator:**
1. Create an emulator via AVD Manager (Tools → Device Manager)
2. Click the "Run" button (green play icon)

**Run on Physical Device:**
1. Enable Developer Options and USB Debugging on your device
2. Connect device via USB
3. Click the "Run" button and select your device

## Building APK

### Debug APK

```bash
# Command line
./gradlew assembleDebug

# Android Studio
Build → Build Bundle(s) / APK(s) → Build APK(s)
```

Output: `app/build/outputs/apk/debug/app-debug.apk`

### Release APK (Unsigned)

```bash
./gradlew assembleRelease
```

Output: `app/build/outputs/apk/release/app-release-unsigned.apk`

### Signed Release APK

1. Create a keystore:
```bash
keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias
```

2. Add to `app/build.gradle.kts`:
```kotlin
android {
    signingConfigs {
        create("release") {
            storeFile = file("../my-release-key.jks")
            storePassword = "your-store-password"
            keyAlias = "my-key-alias"
            keyPassword = "your-key-password"
        }
    }
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            // ... existing config
        }
    }
}
```

3. Build:
```bash
./gradlew assembleRelease
```

## First-Time Setup (API Key)

When you first launch the app:

1. A dialog will appear asking for your OpenAI API key
2. Enter your API key from https://platform.openai.com/api-keys
3. Click "Save"
4. The API key is securely encrypted and stored locally

**To change the API key later:**
- Tap the settings icon (⚙️) in the top-right corner
- Enter your new API key
- Click "Save"

## Usage

1. **Select a Subject**: Choose from Matematika, Ingliz tili, Fizika, or Tarix
2. **Enter Your Question**: Type your educational question in the text field
3. **Get Answer**: Tap "Javob olish" to receive an AI-generated response
4. **View Chat History**: Scroll through previous questions and answers
5. **Copy Answers**: Tap the copy icon on any message to copy it to clipboard
6. **Clear Chat**: Tap "Chatni tozalash" to start a fresh conversation

## Project Structure

```
AIStudentAssistant/
├── app/
│   ├── src/
│   │   └── main/
│   │       ├── java/uz/ai/studentassistant/
│   │       │   ├── data/
│   │       │   │   ├── AIRepository.kt
│   │       │   │   ├── ApiModels.kt
│   │       │   │   └── ChatMessage.kt
│   │       │   ├── network/
│   │       │   │   ├── OpenAIApi.kt
│   │       │   │   └── RetrofitClient.kt
│   │       │   ├── ui/
│   │       │   │   ├── ChatAdapter.kt
│   │       │   │   ├── MainViewModel.kt
│   │       │   │   └── MainViewModelFactory.kt
│   │       │   ├── utils/
│   │       │   │   ├── ApiKeyManager.kt
│   │       │   │   └── Resource.kt
│   │       │   └── MainActivity.kt
│   │       ├── res/
│   │       │   ├── layout/
│   │       │   │   ├── activity_main.xml
│   │       │   │   ├── item_chat_message.xml
│   │       │   │   └── dialog_api_key.xml
│   │       │   ├── values/
│   │       │   │   ├── colors.xml
│   │       │   │   ├── strings.xml
│   │       │   │   └── themes.xml
│   │       │   ├── drawable/
│   │       │   └── menu/
│   │       └── AndroidManifest.xml
│   └── build.gradle.kts
├── build.gradle.kts
├── settings.gradle.kts
└── README.md
```

## API Integration

The app uses OpenAI's Chat Completions API:

**Endpoint**: `https://api.openai.com/v1/chat/completions`

**Request Format**:
```json
{
  "model": "gpt-4o-mini",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful teacher explaining concepts clearly and simply to students."
    },
    {
      "role": "user",
      "content": "Subject: Matematika. Question: What is the Pythagorean theorem?"
    }
  ]
}
```

## Troubleshooting

### Build Errors

**Problem**: `SDK location not found`
**Solution**: Create `local.properties` with your SDK path

**Problem**: `Unable to resolve dependency`
**Solution**: Check internet connection and Gradle sync

**Problem**: `Minimum supported Gradle version is X.X`
**Solution**: Update Gradle wrapper in `gradle/wrapper/gradle-wrapper.properties`

### Runtime Errors

**Problem**: App crashes on launch
**Solution**: Check logcat for errors, ensure all permissions are granted

**Problem**: "Network error" message
**Solution**: Verify internet connection and API key validity

**Problem**: API requests fail
**Solution**: 
- Check API key is valid and has credits
- Verify internet connectivity
- Check OpenAI API status

## Performance Optimization

- Uses Coroutines for non-blocking network calls
- RecyclerView with DiffUtil for efficient list updates
- ViewBinding for reduced overhead
- Encrypted SharedPreferences cached for performance

## Security Features

- ✅ API key stored using EncryptedSharedPreferences
- ✅ HTTPS-only network communication
- ✅ ProGuard rules for code obfuscation
- ✅ No hardcoded secrets in code
- ✅ Backup rules exclude sensitive data

## Future Enhancements

- [ ] Voice input support
- [ ] Multi-language UI support
- [ ] Offline mode with cached responses
- [ ] Export chat history
- [ ] Custom AI personality settings
- [ ] Image-based questions
- [ ] Study progress tracking

## License

This project is for educational purposes. OpenAI API usage is subject to OpenAI's terms of service.

## Credits

- Developed using Kotlin and Android Jetpack
- UI designed with Material Design 3
- AI powered by OpenAI GPT-4o-mini

## Support

For issues or questions:
1. Check the Troubleshooting section
2. Review OpenAI API documentation
3. Check Android Studio build output

---

**Version**: 1.0  
**Min Android Version**: 7.0 (API 24)  
**Target Android Version**: 14 (API 34)  
**Last Updated**: February 2025
