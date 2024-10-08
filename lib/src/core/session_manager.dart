import 'package:flutter_auth/src/storage/token_storage.dart';

class SessionManager {
  final TokenStorage _storage;

  SessionManager(this._storage);

  Future<void> saveToken(String token) async {
    await _storage.saveToken(token);
  }

  Future<String?> getToken() async {
    return await _storage.getToken();
  }

  Future<void> clearSession() async {
    await _storage.clearToken();
  }
}
