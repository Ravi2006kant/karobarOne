import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  static const String _accessTokenKey = "access_token";
  static const String _refreshTokenKey = "refresh_token";
  static const String _tokenTypeKey = "token_type";
  static const String _userIdKey = "user_id";

// fastapi return the tokens
  Future<void> saveAuth({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required String userId
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
    await _storage.write(key: _tokenTypeKey, value: tokenType);
    await _storage.write(key: _userIdKey, value: userId);
  }


  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<String?> getTokenType() async {
    return await _storage.read(key: _tokenTypeKey);
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }
//logout
  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> updateAccessToken(String newAccessToken) async {
    await _storage.write(
      key: _accessTokenKey,
      value: newAccessToken,
    );
  }

  Future<void> logout() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _tokenTypeKey);
    await _storage.delete(key: _userIdKey);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}