# SocialX News App

**SocialX News App** is a Flutter application that features a user authentication system with a login and signup UI, and displays news to authenticated users. The app uses Firebase for authentication and integrates various packages to enhance functionality and provide a smooth user experience and has a logout functionality.

## Overview

This application offers:

- A clean and user-friendly UI for logging in and signing up.
- Secure user authentication with Firebase.
- Fetching and displaying news for authenticated users.
- Local data storage with Hive for offline access.

## Features

- **Login and Signup**:
  - Attractive and functional UI for user authentication.
  - Input validation and error handling.
- **Firebase Authentication**:
  - Secure login and signup processes.
  - Password recovery option.
- **News Display**:
  - Shows news articles to authenticated users.
- **Local Storage**:
  - Uses Hive for efficient local data storage, allowing offline access.

## Packages Used

### Core Packages

1. **firebase_core: ^3.1.0**
   - Initializes Firebase services in the app.
   - Required for using other Firebase functionalities.

2. **firebase_auth: ^5.1.0**
   - Manages user authentication including login, signup, and password recovery.

3. **firebase_ui_auth: ^1.15.0**
   - Provides pre-built UI components for Firebase authentication.
   - Simplifies the integration of Firebase authentication with the app’s UI.

4. **http: ^1.2.1**
   - Makes HTTP requests to fetch news data.
   - Ensures structured and efficient communication with external APIs.

### Storage and State Management

5. **hive: ^2.2.3**
   - A lightweight, fast key-value database for local data storage.
   - Selected for its simplicity and performance in Flutter applications.

6. **hive_flutter: ^1.1.0**
   - Integrates Hive with Flutter for seamless local data management.
   - Allows the app to store and retrieve data efficiently.

7. **path_provider: ^2.1.3**
   - Locates commonly used directories on the filesystem.
   - Facilitates file storage and management.

8. **provider: ^6.1.2**
   - A state management library for managing app-wide state.
   - Ensures efficient data flow and state management.

### Development and Utility

9. **hive_generator: ^2.0.1**
    - Generates boilerplate code for Hive models.
    - Reduces manual coding for Hive integration.

10. **build_runner: ^2.4.11**
    - Executes code generators like `hive_generator`.
    - Automates the generation of required files for Hive and other tools.

11. **intl: ^0.19.0**
    - Supports internationalization and localization.
    - Provides utilities for formatting dates, numbers, and messages.

12. **intl_phone_field: ^3.2.0**
    - A widget for inputting and validating phone numbers with country codes.
    - Enhances the user input experience with phone number formatting and validation.

## Getting Started

### Prerequisites

Ensure you have the following installed:

- Flutter SDK
- Dart SDK
- A Firebase project set up and configured

### Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Nitinjiwnani/flutter_news_app.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd flutter_news_app
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Set up Firebase**:
    - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
    - Add an Android/iOS app to your Firebase project and follow the setup instructions.
    - Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place it in the appropriate directory.

5. **Run the application**:
    ```bash
    flutter run
    ```

### Usage

1. **Login**: Enter your email and password to log in.
2. **Signup**: Register a new account with your email and password.
3. **View News**: After logging in, browse the latest news articles.

### Demo Video

Watch a short video demonstration of the app's functionality [here](https://github.com/Nitinjiwnani/flutter_news_app).


https://github.com/Nitinjiwnani/flutter_news_app/assets/86294062/e9d2ba57-6e99-4339-adba-fa8e5924914a






### Contact

For questions or feedback, open an issue or contact me at [jiwnani01@gmail.com](mailto:jiwnani01@gmail.com).

## Additional Resources

For new Flutter developers, here are some useful resources:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter documentation](https://docs.flutter.dev/): Tutorials, samples, and a full API reference.

Thank you for exploring **SocialX News App**. We hope this README helps you understand the project and get started quickly. Happy coding! 🚀


