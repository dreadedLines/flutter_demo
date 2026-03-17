import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences prefs;

  static const _colorKey = 'myColor';
  static const _textStringKey = 'myResponse';
  static const _themeModeKey = "themeMode";

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Color getColor() {
    final colorInt = prefs.getInt(_colorKey) ?? 0xff_000000;
    return Color(colorInt);
  }

  String getTextString() {
    final textString = prefs.getString(_textStringKey) ?? "Error";
    return textString;
  }

  ThemeMode getThemeMode() {
    final savedThemeMode = prefs.getString(_themeModeKey);
    if (savedThemeMode == "light") {
      return ThemeMode.light;
    } else if (savedThemeMode == "dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  Future<void> setColor(Color color) async {
    await prefs.setInt(_colorKey, color.toARGB32());
  }

  Future<void> setText(String string) async {
    await prefs.setString(_textStringKey, string);
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    String value;
    // TODO: replace with map
    if (themeMode == ThemeMode.light) {
      value = "light";
    } else if (themeMode == ThemeMode.dark) {
      value = "dark";
    } else {
      value = "system";
    }
    await prefs.setString(_themeModeKey, value);
  }

}