import 'package:flutter/material.dart';

class TestingManager {
  final result = ValueNotifier<double>(0);

  void add(String first, String second) {
    result.value = double.parse(first) + double.parse(second);
  }
}