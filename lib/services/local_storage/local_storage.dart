import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences prefs;

  static const _colorKey = 'myColor';
  static const _textStringKey = 'myResponse';

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Color getColor() {
    final colorInt = prefs.getInt(_colorKey) ?? 0x00_000000;
    return Color(colorInt);
  }

  String getText() {
    final textString = prefs.getString(_textStringKey) ?? "Error";
    return textString;
  }
}