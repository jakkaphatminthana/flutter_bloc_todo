import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static SharedPreferenceService? _instance;

  final Future<SharedPreferences> _sharedPref;

  const SharedPreferenceService._(this._sharedPref);

  factory SharedPreferenceService({
    required Future<SharedPreferences> sharedPref,
  }) {
    return _instance ??= SharedPreferenceService._(sharedPref);
  }

  Future<String?> getData({
    required String key,
  }) async {
    final SharedPreferences pref = await _sharedPref;
    final String? result = pref.getString(key);
    return result;
  }

  Future<void> setData({
    required String key,
    required String data,
  }) async {
    final SharedPreferences pref = await _sharedPref;
    pref.setString(key, data);
    log("set data SharedPreferences success!");
  }

  Future<void> remove({
    required String key,
  }) async {
    final SharedPreferences pref = await _sharedPref;
    pref.remove(key);
    log("remove data $key !");
  }
}
