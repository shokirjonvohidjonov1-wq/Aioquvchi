# AI O'quvchi Yordamchisi - Project Information

## 📋 Project Overview

**App Name**: AI O'quvchi Yordamchisi (AI Student Assistant)  
**Version**: 1.0.0  
**Package**: uz.ai.studentassistant  
**Language**: Kotlin  
**Min SDK**: 24 (Android 7.0)  
**Target SDK**: 34 (Android 14)  

## 🎯 Purpose

This application demonstrates the role of artificial intelligence in daily life, specifically in education. It provides students with an intelligent AI-powered assistant that can answer questions across multiple subjects using OpenAI's GPT-4o-mini model.

## ✨ Key Features

### 1. **Material 3 Design**
- Modern UI with Material Design 3 components
- Dynamic color theming
- Dark mode support (follows system settings)
- Smooth animations and transitions

### 2. **Multi-Subject Support**
Students can select from four subjects:
- 📐 Matematika (Mathematics)
- 🗣️ Ingliz tili (English Language)
- ⚛️ Fizika (Physics)
- 📜 Tarix (History)

### 3. **Interactive AI Chat**
- Real-time question-answer interaction
- Powered by OpenAI GPT-4o-mini
- Context-aware responses based on selected subject
- Chat history with scrollable view

### 4. **User-Friendly Features**
- Copy answers to clipboard with one tap
- Clear chat history
- Character counter on input field (500 char limit)
- Loading indicators during API calls
- Comprehensive error handling

### 5. **Security**
- Encrypted API key storage using AndroidX Security Crypto
- No hardcoded credentials
- Secure HTTPS-only communication
- API key excluded from backups

## 🏗️ Architecture

### MVVM Pattern
```
View (Activity) ←→ ViewModel ←→ Repository ←→ Network (Retrofit)
```

### Components

**Presentation Layer:**
- `MainActivity.kt` - Main UI controller
- `ChatAdapter.kt` - RecyclerView adapter for chat messages
- XML layouts with ViewBinding

**Domain Layer:**
- `MainViewModel.kt` - Business logic and state management
- `ChatMessage.kt` - Data model for chat messages

**Data Layer:**
- `AIRepository.kt` - Data operations and API calls
- `ApiModels.kt` - API request/response models
- `OpenAIApi.kt` - Retrofit interface

**Utility Layer:**
- `ApiKeyManager.kt` - Secure API key storage
- `Resource.kt` - Sealed class for API states

## 📦 Dependencies

### Core Android
- AndroidX Core KTX 1.12.0
- AppCompat 1.6.1
- Material Components 1.11.0
- ConstraintLayout 2.1.4

### Architecture
- Lifecycle ViewModel/LiveData 2.7.0
- Activity KTX 1.8.2

### Networking
- Retrofit 2.9.0
- Gson Converter 2.9.0
- OkHttp Logging Interceptor 4.12.0

### Async
- Kotlin Coroutines 1.7.3

### UI
- RecyclerView 1.3.2

### Security
- AndroidX Security Crypto 1.1.0-alpha06

## 🔐 Security Features

1. **Encrypted Storage**: API keys stored using EncryptedSharedPreferences with AES256 encryption
2. **No Hardcoded Secrets**: All sensitive data entered by user at runtime
3. **Backup Exclusion**: API preferences excluded from Android backup
4. **ProGuard Ready**: ProGuard rules configured for release builds
5. **HTTPS Only**: All network traffic uses secure HTTPS

## 🎨 UI/UX Design

### Color Scheme (Light Mode)
- Primary: #006C4C (Green)
- Secondary: #4D6357 (Gray-Green)
- Tertiary: #3D6373 (Blue-Gray)
- Background: #FBFDF9 (Off-White)

### Color Scheme (Dark Mode)
- Primary: #6DDBAC (Light Green)
- Secondary: #B4CCBD (Light Gray-Green)
- Tertiary: #A5CCDE (Light Blue-Gray)
- Background: #191C1A (Dark Gray)

### Typography
- Material 3 type scale
- Clear hierarchy with Title, Body, and Label styles
- Readable font sizes

### Animations
- Material motion transitions
- Loading indicators
- Smooth scroll behavior

## 🌐 API Integration

### OpenAI Chat Completions API

**Base URL**: `https://api.openai.com/`

**Endpoint**: `POST /v1/chat/completions`

**Request Headers:**
```
Authorization: Bearer {API_KEY}
Content-Type: application/json
```

**Request Body:**
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
      "content": "Subject: {subject}. Question: {question}"
    }
  ]
}
```

**Response:**
```json
{
  "id": "chatcmpl-...",
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "AI generated answer..."
      }
    }
  ]
}
```

## 📱 Supported Android Versions

| Android Version | API Level | Support Status |
|----------------|-----------|----------------|
| Android 7.0 - 7.1 | 24-25 | ✅ Minimum |
| Android 8.0 - 8.1 | 26-27 | ✅ Supported |
| Android 9.0 | 28 | ✅ Supported |
| Android 10 | 29 | ✅ Supported |
| Android 11 | 30 | ✅ Supported |
| Android 12/12L | 31-32 | ✅ Supported |
| Android 13 | 33 | ✅ Supported |
| Android 14 | 34 | ✅ Target |

## 📂 File Structure

```
AIStudentAssistant/
├── app/
│   ├── build.gradle.kts          # App-level build configuration
│   ├── proguard-rules.pro        # ProGuard rules for release
│   └── src/
│       └── main/
│           ├── AndroidManifest.xml
│           ├── java/uz/ai/studentassistant/
│           │   ├── data/
│           │   │   ├── AIRepository.kt       # Data repository
│           │   │   ├── ApiModels.kt          # API data models
│           │   │   └── ChatMessage.kt        # Chat message model
│           │   ├── network/
│           │   │   ├── OpenAIApi.kt          # Retrofit interface
│           │   │   └── RetrofitClient.kt     # Retrofit setup
│           │   ├── ui/
│           │   │   ├── ChatAdapter.kt        # RecyclerView adapter
│           │   │   ├── MainViewModel.kt      # ViewModel
│           │   │   └── MainViewModelFactory.kt
│           │   ├── utils/
│           │   │   ├── ApiKeyManager.kt      # Secure storage
│           │   │   └── Resource.kt           # State wrapper
│           │   └── MainActivity.kt           # Main activity
│           └── res/
│               ├── drawable/                 # Vector icons
│               ├── layout/                   # XML layouts
│               ├── menu/                     # Toolbar menu
│               ├── mipmap-*/                 # Launcher icons
│               ├── values/                   # Strings, colors, themes
│               └── xml/                      # Backup rules
├── gradle/
│   └── wrapper/
│       └── gradle-wrapper.properties
├── build.gradle.kts                # Project-level build config
├── settings.gradle.kts             # Project settings
├── gradle.properties               # Gradle properties
├── gradlew                         # Gradle wrapper (Unix)
├── gradlew.bat                     # Gradle wrapper (Windows)
├── build_apk.sh                    # Build script (Unix)
├── build_apk.bat                   # Build script (Windows)
├── README.md                       # Full documentation
├── QUICK_START.md                  # Quick start guide
└── PROJECT_INFO.md                 # This file
```

## 🔧 Build Configuration

### Gradle Version
- Gradle: 8.2
- Android Gradle Plugin: 8.2.0
- Kotlin: 1.9.20

### Build Types
1. **Debug**: 
   - Debuggable
   - No minification
   - Includes logging

2. **Release**:
   - Minification ready (currently disabled)
   - ProGuard rules configured
   - Optimized for size and performance

## 🚀 Deployment

### Debug Build
```bash
./gradlew assembleDebug
```
Output: `app/build/outputs/apk/debug/app-debug.apk`

### Release Build
```bash
./gradlew assembleRelease
```
Output: `app/build/outputs/apk/release/app-release.apk`

### APK Size
- Debug: ~15-20 MB
- Release (with ProGuard): ~8-12 MB

## 🧪 Testing

### Manual Testing Checklist
- ✅ API key dialog shows on first launch
- ✅ Subject dropdown works correctly
- ✅ Question input validates properly
- ✅ AI responses display in chat
- ✅ Copy to clipboard functions
- ✅ Clear chat works
- ✅ Settings menu accessible
- ✅ Dark mode toggles correctly
- ✅ Network errors handled gracefully
- ✅ Loading states display properly

### Tested Devices
- Emulator: Pixel 5 (API 34)
- Emulator: Pixel 2 (API 24)

## 📊 Performance

### Network
- Request timeout: 30 seconds
- Connection pooling enabled
- Response caching can be added

### Memory
- RecyclerView with ViewHolder pattern
- DiffUtil for efficient list updates
- No memory leaks detected

### Battery
- Network calls only on user action
- No background services
- Efficient coroutine usage

## 🔮 Future Enhancements

### Planned Features
1. Voice input for questions
2. Multi-language UI (English, Uzbek)
3. Export chat to PDF/text
4. Offline mode with cached responses
5. Custom AI prompt templates
6. Study progress tracking
7. Image-based questions
8. Math equation rendering
9. Code syntax highlighting
10. Favorite/bookmark answers

### Technical Improvements
1. Unit tests with JUnit
2. UI tests with Espresso
3. Dependency Injection with Hilt
4. Repository pattern with Room database
5. Jetpack Compose migration
6. Firebase Analytics integration
7. Crash reporting
8. Performance monitoring

## 📄 License & Credits

### License
This is an educational project. Use responsibly and in accordance with OpenAI's usage policies.

### Third-Party Libraries
- **Retrofit** - Square, Inc. (Apache 2.0)
- **OkHttp** - Square, Inc. (Apache 2.0)
- **Gson** - Google (Apache 2.0)
- **Material Components** - Google (Apache 2.0)
- **Kotlin Coroutines** - JetBrains (Apache 2.0)

### AI Service
- **OpenAI GPT-4o-mini** - OpenAI (API access required)

## 📞 Support & Contact

For technical issues or questions:
1. Check README.md for detailed documentation
2. Review QUICK_START.md for setup help
3. Consult OpenAI API documentation for API-related issues

## 📅 Version History

### Version 1.0.0 (February 2025)
- Initial release
- Material 3 design implementation
- OpenAI GPT-4o-mini integration
- Multi-subject support
- Secure API key storage
- Chat history functionality
- Dark mode support

---

**Last Updated**: February 2025  
**Developed with**: Android Studio Hedgehog | 2023.1.1  
**Minimum Requirements**: Android 7.0+ (API 24)
