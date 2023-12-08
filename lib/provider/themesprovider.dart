import 'package:coindice/themes/themes.dart';
import 'package:flutter/material.dart';


class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  bool get isDark => _themeData == darkMode;

  void toggleTheme() {
    _themeData = isDark ? lightMode : darkMode;
    notifyListeners();
  }
}

