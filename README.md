# GIPHY Flutter App

A simple Flutter application that allows users to search for GIFs using the GIPHY API and display them in a grid format.

## 📌 Features
- Search GIFs using the GIPHY API
- Display GIFs in a responsive grid view (4 GIFs per row)
- Caching for better performance using `cached_network_image`
- State management using `Provider`
- Optimized API requests using `Dio`

## 🛠️ Technologies Used
- **Flutter** (Dart)
- **Dio** (for API calls)
- **Provider** (for state management)
- **CachedNetworkImage** (for efficient image loading)
- **GIPHY API** (for fetching GIFs)

## 📂 Directory Structure
```
giphy_flutter_app/
│── lib/
│   ├── main.dart
│   ├── models/
│   │   ├── gif_model.dart
│   ├── providers/
│   │   ├── gif_provider.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   ├── services/
│   │   ├── api_service.dart
│   ├── widgets/
│   │   ├── gif_tile.dart
│   │   ├── search_bar_widget.dart
│── pubspec.yaml
```

## 🚀 Setup & Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/giphy_flutter_app.git
cd giphy_flutter_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the application**
```bash
flutter run
```

## 🔑 API Key Setup
This project uses the GIPHY API. Replace `YOUR_GIPHY_API_KEY` in `api_service.dart` with your own API key.

You can get a free API key from [GIPHY Developers](https://developers.giphy.com/).

```dart
static const String apiKey = "YOUR_GIPHY_API_KEY";
```

## 🎯 Usage
1. Type a keyword in the search bar.
2. Click the **Search** button.
3. Browse the fetched GIFs displayed in a grid.

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
### 🔥 Happy Coding! 🚀
