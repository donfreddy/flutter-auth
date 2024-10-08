# Flutter-auth 📱🔒

<a href="https://github.com/donfreddy/flutter-auth/releases"><img src="https://img.shields.io/npm/v/flutter-auth/latest?style=flat-square&label=latest%20stable" alt="" /></a>
<a href="https://www.npmtrends.com/flutter-auth"><img src="https://img.shields.io/npm/dm/next-auth?style=flat-square&color=cyan" alt="Downloads" /></a>
<a href="https://codecov.io/gh/donfreddy/flutter-auth" ><img alt="Codecov" src="https://img.shields.io/codecov/c/github/donfreddy/flutter-auth?token=o2KN5GrPsY&style=flat-square&logo=codecov"></a>
<img src="https://img.shields.io/badge/Dart-Language-blue?logo=dart" alt="Dart" />

A simple and extensible authentication package for Flutter applications. flutter-auth provides out-of-the-box support for various authentication 
providers (e.g., Google, Facebook, GitHub, etc.) and allows easy integration with OAuth, token management, and secure session handling.

:star: Star us on GitHub — it motivates us a lot!

[![GitHub stars](https://img.shields.io/github/stars/donfreddy/flutter-auth.svg?style=social&label=Star)](https://github.com//donfreddy/flutter-auth) 
&nbsp;
![GitHub forks](https://img.shields.io/github/forks/donfreddy/flutter-auth.svg?style=social&label=Forks) 
&nbsp;
![GitHub followers](https://img.shields.io/github/followers/donfreddy.svg?style=social&label=Follow)



## ✨ Features

- [x] 🚀 Multiple Providers: Out-of-the-box support for popular OAuth providers like Google, Facebook, GitHub, and more.
- [ ] 🔐 JWT (JSON Web Tokens): Full support for JWT-based authentication, session management, and token rotation.
- [ ] ⚙️ Credentials Provider: Use your own credentials-based authentication system (e.g., username/password, API key).
- [ ] 🔁 Session Management: Robust handling of sessions, with options for stateless (JWT) and stateful (session storage).
- [ ] 🛡️ Secure Storage: Securely store tokens and credentials using platform-specific secure storage.
- [ ] 🧩 Custom Providers: Flexibly integrate with any authentication system, including custom OAuth and enterprise systems.
- [ ] 🧪 Testable and Extensible: Highly modular and easy to test, customize, and extend.

## 📦 Installation

Add flutter-auth as a dependency in your pubspec.yaml file:
```yaml
dependencies:
  flutter-auth: ^0.0.1 # latest version
```
Run the following command to install the package:
```bash
flutter pub get
```

## 🚀 Getting started

Follow these steps to integrate flutter-auth in your Flutter project.

### Import the Package
```dart
import 'package:flutter_auth/flutter_auth.dart';
```

### Initialize the AuthService

To enable authentication with different providers, instantiate the AuthService with a list of supported providers.
```dart
import 'package:flutter_auth/flutter_auth.dart';

void main() {
  // Initialize AuthService with OAuth and credentials providers
  AuthService authService = AuthService(
    providers: [
      GoogleProvider(clientId: 'YOUR_GOOGLE_CLIENT_ID'),
      FacebookProvider(appId: 'YOUR_FACEBOOK_APP_ID'),
      GitHubProvider(clientId: 'YOUR_GITHUB_CLIENT_ID'),
      CredentialsProvider(), // For username/password or API keys
    ],
    sessionManager: SessionManager(SecureStorage()), // Secure token storage
  );

  runApp(MyApp(authService));
}
```

### Sign In with a Provider

Invoke the login method for any provider, e.g., Google, Facebook, GitHub, or your own custom credentials provider.
```dart
Future<void> signInWithGoogle() async {
  try {
    User? user = await authService.login(AuthProvider.google);
    print("Signed in as ${user?.name}");
  } catch (e) {
    print("Login failed: $e");
  }
}
```

### Sign In with Credentials

You can also authenticate users via credentials (e.g., username/password or API key).
```dart
Future<void> signInWithCredentials(String username, String password) async {
  try {
    User? user = await authService.loginWithCredentials(
      username: username,
      password: password,
    );
    print("Signed in as ${user?.name}");
  } catch (e) {
    print("Login failed: $e");
  }
}
```

### Sign Out
```dart
Future<void> signOut() async {
  await authService.logout();
}
```

## 🔑 Token and Session Management

flutter-auth automatically manages user sessions. It supports both stateless (JWT) and stateful session storage.

### JWT Token Management

To enable JWT-based authentication:
```dart
AuthService authService = AuthService(
  providers: [
    GoogleAuthProvider(),
    CredentialsAuthProvider(),
  ],
  sessionManager: SessionManager(SecureStorage()),
  tokenStrategy: TokenStrategy.jwt, // Enable JWT for token management
);
```

### Stateful Session Management

For session-based authentication (with tokens stored in-memory or securely ):
```dart
AuthService authService = AuthService(
  providers: [
    GoogleAuthProvider(),
  ],
  sessionManager: SessionManager(SecureStorage()), // Secure session handling
  tokenStrategy: TokenStrategy.session, // Use session tokens
);
```

## 🛠 Custom OAuth Provider

To add a custom OAuth provider, implement the OAuthProvider interface:
```dart
class CustomOAuthProvider implements OAuthProvider {
  @override
  Future<User?> login() async {
    // Implement OAuth login flow here
  }

  @override
  Future<void> logout() async {
    // Implement logout flow
  }

  @override
  String get name => 'custom';
}
```

Then, add your provider to AuthService:
```dart
AuthService authService = AuthService(
  providers: [
    CustomOAuthProvider(),
  ],
);
```

## 🛠 Configuration

You can configure several options within flutter-auth, including:
- Session Expiration: Customize session duration and auto-refresh behavior.
- Custom JWT Handling: Override default JWT encoding/decoding.
- Token Rotation: Ensure that tokens are rotated securely.

These configurations are passed via the AuthServiceConfig object when initializing AuthService.

## 🚧 Roadmap

- [ ] Token Rotation Support: Automatically refresh expired tokens.
- [ ] More Providers: Add support for more providers like Twitter, Apple, LinkedIn.
- [ ] 2FA: Integrate Two-Factor Authentication.
- [ ] Web and Desktop Support: Extend to Flutter Web and desktop platforms.

## 🛠 Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process
for submitting pull requests to us.

## ✅ Running Tests

To run tests for flutter-auth, use:
```bash
flutter test
```
Ensure all tests pass before submitting a pull request.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](https://next-auth.js.org) file for details.

## 🙌 Acknowledgments

- Inspired by [NextAuth.js](LICENSE.md) for React, bringing similar authentication capabilities to Flutter.
- Special thanks to the Flutter and Dart communities for their support and contributions.
