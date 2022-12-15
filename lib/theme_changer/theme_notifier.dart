import 'package:flutter/material.dart';
import 'mytheme_preference.dart';

class ThemeNotifer extends ChangeNotifier {

  late bool _isDark;
  late MyThemePreference _preferences;

  ThemeNotifer() {
    _isDark = false;
    _preferences = MyThemePreference();
    getPreferences();
  }

  bool get isDark => _isDark;

  //Switching the themes
  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}