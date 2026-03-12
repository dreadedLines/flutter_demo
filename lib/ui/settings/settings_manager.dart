import 'package:demo/app_state.dart';
import 'package:demo/services/service_locator.dart';
import 'package:flutter/material.dart';

class SettingsManager{
  final appState = getIt<AppState>();

  ThemeMode get currentTheme => appState.theme;
  void setTheme(ThemeMode newTheme) => appState.setTheme(newTheme);
}