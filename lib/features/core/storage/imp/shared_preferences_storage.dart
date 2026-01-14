import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../i_local_storage.dart';

class SharedPreferencesStorage implements ILocalStorage {
  final SharedPreferences _prefs;

  SharedPreferencesStorage(this._prefs);

  @override
  Future<void> save<T>(String key, T value) async {
    final jsonString = jsonEncode(value);
    await _prefs.setString(key, jsonString);
  }

  @override
  T? read<T>(String key) {
    final jsonString = _prefs.getString(key);
    if (jsonString == null) return null;

    return jsonDecode(jsonString) as T;
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}
