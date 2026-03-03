import 'package:flutter/material.dart';

class StateManagementManager {
  var myColors = [Colors.red, Colors.orange, Colors.amber, Colors.lime, Colors.indigo, Colors.brown, Colors.white];
  final colorNotifier = ValueNotifier<Color>(
    myColors[0]
  );

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
}