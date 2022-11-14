import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:creatu_exam/res/app_string.dart';

class SecureStorage {
  final _secureStorage = const FlutterSecureStorage();
  Future<String?> getToken() async {
    return await _secureStorage.read(key: AppString.tokenKey);
  }

  Future<void> setToken(String token) async {
    log('setting AT');
    await _secureStorage.write(key: AppString.tokenKey, value: token);
  }

  Future<void> deleteAll() async {
    log('Logging OUT AT');
    await _secureStorage.deleteAll();
  }
}
