library flutter_auth;

// Abstract class for authentication providers
abstract class AuthProvider {
  Future<void> signIn();

  Future<void> signOut();

  Future<String?> getAccessToken();
}

// Authentication service that manages different providers
class AuthService {
  AuthProvider? _provider;

  AuthService({AuthProvider? provider}) : _provider = provider;

  // Set the provider (Google, Facebook, etc.)
  void setProvider(AuthProvider provider) {
    _provider = provider;
  }

  Future<void> signIn() async {
    if (_provider != null) {
      await _provider!.signIn();
    }
  }

  Future<void> signOut() async {
    if (_provider != null) {
      await _provider!.signOut();
    }
  }

  Future<String?> getAccessToken() async {
    if (_provider != null) {
      return await _provider!.getAccessToken();
    }
    return null;
  }
}
