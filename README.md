# AI Song Creation Chat Interface 🎶

A Flutter app prototype for [SongGPT](http://www.songgpt.com), this application allows users to interact with an AI to create songs through a smooth, engaging, and visually appealing chat interface. The app supports dark/light themes, message animations, and simulated AI responses to create an immersive experience.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Project Structure](#project-structure)
- [Screenshots](#screenshots)
- [Technologies Used](#technologies-used)
- [To Do](#to-do)
- [Contact](#contact)

---

## Features

- **AI Chat Interface**: Interact with an AI to generate song lyrics.
- **Smooth Animations**: Message animations and AI typing simulation.
- **Dark/Light Mode**: Toggle between dark and light themes for a personalized experience.
- **User-Friendly Navigation**: Intuitive navigation across home, chat, song detail, and profile screens.
- **Firestore Integration**: Store and retrieve chat history for each user.

## Getting Started

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/bitwisedhruv/ai-song-creation-chat-interface.git
   cd ai-song-creation-chat-interface
   ```
2. **Install Dependencies**
   ```dart
   flutter pub get
   ```

### Running the App

After setup, you can run the app using:

```dart
flutter run
```

## Project Structure

The project follows a feature-based structure for better scalability ans maintainability.

## Key Directories

- **feature**: Contains core features of the app, organized by repositories (business logic), controller (interacts with repositories), and screens (UI).

- **models**: Defines data models, such as `ChatMessage`, `ResponseModel`, and `User`.

- **utils**: Contains helper functions, constants, and utilities.

## Technologies Used

- **Flutter**: Cross-platform development.
- **Firebase**: Backend-as-a-Service.
  - Firestore for storing chat data.
  - Firebase Authentication for user management.
- **Riverpod**: State management.

## Screenshots
