import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async => _prefsInstance;

  static late SharedPreferences _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }

  static String getString(String key, [String? defult]) {
    return _prefsInstance.getString(key) ?? defult ?? '';
  }

  static Future<bool> setString(String key, String value) async {
   
    var prefs = await _instance;
    return prefs.setString(key, value);
  }
}
