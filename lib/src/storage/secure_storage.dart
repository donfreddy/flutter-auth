import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'token_storage.dart';

class SecureStorage implements TokenStorage {
  static const _tokenKey = 'auth_token';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> clearToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }
}
