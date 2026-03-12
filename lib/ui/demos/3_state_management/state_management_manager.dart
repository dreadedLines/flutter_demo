import 'package:demo/services/service_locator.dart';
import 'package:flutter/material.dart';
import '../../../services/local_storage/local_storage.dart';

class StateManagementManager {
  final localStorage = getIt<LocalStorage>();

  var myColors = [Colors.red, Colors.orange, Colors.amber, Colors.lime, Colors.indigo, Colors.brown, Colors.white];
  var colorNotifier = ValueNotifier<Color>(
    Colors.white // myColors don't work for some reason
  );
  var stringNotifier = ValueNotifier("Hello");

  int colorIndex = 0;
  int textIndex = 0;
  int responseIndex = 0;
  final myResponses = ["Hello", "World", "How is your day?", "This works", "Good"];

  void changeColor() {
    colorIndex++;
    colorIndex %= myColors.length;
    colorNotifier.value = myColors[colorIndex];
    localStorage.setColor(colorNotifier.value);
  }
  void changeText() {
    textIndex = (textIndex + 1) % myResponses.length;
    stringNotifier.value = myResponses[textIndex];
    localStorage.setText(stringNotifier.value);
  }

  void init() {
    final color = getIt<LocalStorage>().getColor();
    final text = getIt<LocalStorage>().getTextString();
    
    colorNotifier.value = color;
    stringNotifier.value = text;
  }
}