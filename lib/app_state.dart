import 'package:demo/services/local_storage/local_storage.dart';
import 'package:demo/services/service_locator.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final localStorage = getIt<LocalStorage>();

  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;

  Future<void> init() async {
    final savedThemeMode =  localStorage.getThemeMode();
    _theme = savedThemeMode;
    notifyListeners();
  }
}