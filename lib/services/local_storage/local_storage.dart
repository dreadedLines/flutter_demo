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
    final colorInt = prefs.getInt(_colorKey) ?? 0xff_000000;
    return Color(colorInt);
  }

  String getTextString() {
    final textString = prefs.getString(_textStringKey) ?? "Error";
    return textString;
  }

  Future<void> setColor(Color color) async {
    await prefs.setInt(_colorKey, color.toARGB32());
  }

  Future<void> setText(String string) async {
    await prefs.setString(_textStringKey, string);
  }

}