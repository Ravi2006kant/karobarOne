import 'package:flutter/material.dart';
import 'package:karobarone/config/themes.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeData get themedata {
    return _isDark ? Themes().darkmode : Themes().lightmode;
  }

  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
