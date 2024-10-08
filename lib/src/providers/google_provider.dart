import 'package:flutter/foundation.dart';
import 'package:flutter_auth/src/core/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Google Auth Provider allows you to authenticate Google users.
class GoogleProvider implements AuthProvider {
  /// Option to determine the sign in user experience. [SignInOption.games] is
  /// only supported on Android.
  final SignInOption signInOption;

  /// The list of [scopes] are OAuth scope codes requested when signing in.
  final List<String> scopes;

  /// Domain to restrict sign-in to.
  final String? hostedDomain;

  /// Client ID being used to connect to google sign-in.
  ///
  /// This option is not supported on all platforms (e.g. Android). It is
  /// optional if file-based configuration is used.
  ///
  /// The value specified here has precedence over a value from a configuration
  /// file.
  final String? clientId;

  /// Client ID of the backend server to which the app needs to authenticate
  /// itself.
  ///
  /// Optional and not supported on all platforms (e.g. web). By default, it
  /// is initialized from a configuration file if available.
  ///
  /// The value specified here has precedence over a value from a configuration
  /// file.
  ///
  /// [GoogleSignInAuthentication.idToken] and
  /// [GoogleSignInAccount.serverAuthCode] will be specific to the backend
  /// server.
  final String? serverClientId;

  /// Force the authorization code to be valid for a refresh token every time. Only needed on Android.
  final bool forceCodeForRefreshToken;

  late final GoogleSignIn _googleSignIn;

  GoogleProvider({
    this.signInOption = SignInOption.standard,
    this.scopes = const <String>[],
    this.hostedDomain,
    this.clientId,
    this.serverClientId,
    this.forceCodeForRefreshToken = false,
  }) {
    _googleSignIn = GoogleSignIn(
      signInOption: signInOption,
      scopes: scopes,
      hostedDomain: hostedDomain,
      clientId: clientId,
      serverClientId: serverClientId,
      forceCodeForRefreshToken: forceCodeForRefreshToken,
    );
  }

  @override
  Future<void> signIn() async {
    final account = await _googleSignIn.signIn();
    if (account == null) {
      throw Exception('Google sign in failed');
    }

    final auth = await account.authentication;
    if (kDebugMode) {
      print('Access Token: ${auth.accessToken}');
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

  @override
  Future<String?> getAccessToken() async {
    final account = await _googleSignIn.signInSilently();
    if (account != null) {
      final GoogleSignInAuthentication auth = await account.authentication;
      return auth.accessToken;
    }
    return null;
  }
}
