import 'package:flutter/material.dart';
import '../../services/local_storage/local_storage.dart';

class StateManagementManager {
  localStorage = LocalStorage();

  var myColors = [Colors.red, Colors.orange, Colors.amber, Colors.lime, Colors.indigo, Colors.brown, Colors.white];
  var colorNotifier = ValueNotifier<Color>(
    Colors.white // myColors don't work for some reason
  );
  var textNotifier = ValueNotifier("Hello");

  int colorIndex = 0;
  int textIndex = 0;
  int responseIndex = 0;
  final myResponses = ["Hello", "World", "How is your day?", "This works", "Good"];
  final responseColors = [
    Color(
      // 0xFFFFFFFF - myColors[textIndex].toARGB32()
      0x00000000
    ),
    Color(
      0xffffffff
    )
  ];

  void changeColor() {
    colorIndex++;
    colorIndex %= myColors.length;
    colorNotifier.value = myColors[colorIndex];
    print(colorNotifier.value);
  }
  void changeText() {
    textIndex = (textIndex + 1) % myResponses.length;
    textNotifier.value = myResponses[textIndex];
    responseIndex = (responseIndex + 1) % responseColors.length;
  }

  void init() {
    final color = localStorage.getColor();
    final text = localStorage.getText();
    colorNotifier.value = color;
    textNotifier.value = text;
  }
}