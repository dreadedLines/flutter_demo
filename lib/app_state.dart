import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;
}