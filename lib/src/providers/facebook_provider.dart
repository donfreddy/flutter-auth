import 'package:flutter_auth/src/core/auth_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookProvider implements AuthProvider {
  @override
  Future<void> signIn() async {
    final result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken? accessToken = result.accessToken;
      // Store the access token
    }
  }

  @override
  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
  }

  @override
  Future<String?> getAccessToken() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    return accessToken?.tokenString;
  }
}
