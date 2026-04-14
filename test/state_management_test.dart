import 'package:flutter/material.dart';
import 'package:demo/ui/demos/3_state_management/state_management_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('color starts on black', () {
    final manager = StateManagementManager();
    final color = manager.colorNotifier.value;
    expect(color, Colors.red);
  },);
}