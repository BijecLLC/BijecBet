import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//Storage
class SecureStorageService {
  SecureStorageService({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  //Storage
  final FlutterSecureStorage _storage;
  //token
  static const String _authTokenKey = 'auth_token';
  static const String _legacyOddsApiKey = 'odds_api_key_v1';
  static String _userSpecificOddsApiKey(String uid) => 'odds_api_key_v1_$uid';

  //Save
  Future<void> saveAuthToken(String token) {
    return _storage.write(key: _authTokenKey, value: token);
  }

  //Read
  Future<String?> readAuthToken() {
    return _storage.read(key: _authTokenKey);
  }

  //Clear
  Future<void> clearAuthToken() {
    return _storage.delete(key: _authTokenKey);
  }

  Future<void> saveOddsApiKey(String key, {String? uid}) {
    final storageKey = uid != null ? _userSpecificOddsApiKey(uid) : _legacyOddsApiKey;
    return _storage.write(key: storageKey, value: key);
  }

  Future<String?> readOddsApiKey({String? uid}) async {
    if (uid != null) {
      final userKey = await _storage.read(key: _userSpecificOddsApiKey(uid));
      if (userKey != null) {
        return userKey;
      }
      
      // Migration: If user-specific key is missing, check the legacy key.
      final legacyKey = await _storage.read(key: _legacyOddsApiKey);
      if (legacyKey != null) {
        // Save the legacy key for the current user and clear it.
        await saveOddsApiKey(legacyKey, uid: uid);
        await clearLegacyOddsApiKey();
        return legacyKey;
      }
      return null;
    }
    return _storage.read(key: _legacyOddsApiKey);
  }

  Future<void> clearOddsApiKey({String? uid}) {
    final storageKey = uid != null ? _userSpecificOddsApiKey(uid) : _legacyOddsApiKey;
    return _storage.delete(key: storageKey);
  }

  Future<void> clearLegacyOddsApiKey() {
    return _storage.delete(key: _legacyOddsApiKey);
  }

  Future<bool> deleteApiKey({String? uid}) async {
    // Execution (Requirement 5.9.1): Hardware Wipe
    await _storage.delete(key: 'odds_api_key');
    
    // Also wipe actual keys used by the app for completeness
    await clearOddsApiKey(uid: uid);
    await clearLegacyOddsApiKey();

    // Verification
    final literalKey = await _storage.read(key: 'odds_api_key');
    final legacyKey = await _storage.read(key: _legacyOddsApiKey);
    final userKey = uid != null ? await _storage.read(key: _userSpecificOddsApiKey(uid)) : null;

    return literalKey == null && legacyKey == null && (uid == null || userKey == null);
  }
}
