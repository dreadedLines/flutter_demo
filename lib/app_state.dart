import 'package:demo/services/local_storage/local_storage.dart';
import 'package:demo/services/service_locator.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final localStorage = getIt<LocalStorage>();

  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;
  void setTheme (ThemeMode newTheme) async {
    _theme = newTheme;
    await localStorage.setThemeMode(newTheme);
    notifyListeners();
  }

  Locale _locale = Locale('en');
  Locale get locale => _locale;
  void setLocale (Locale newLocale) async {
    _locale = newLocale;
    await localStorage.setLocale(newLocale);
    notifyListeners();
  }

  Future<void> init() async {
    final savedThemeMode =  localStorage.getThemeMode();
    _theme = savedThemeMode;
    final savedLocale =  localStorage.getLocale();
    _locale = savedLocale;
    
    notifyListeners();
  }
}