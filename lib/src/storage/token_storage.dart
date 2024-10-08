// This will make it easier to switch or extend the storage method in the future.
abstract class TokenStorage {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> clearToken();
}
