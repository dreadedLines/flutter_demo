import 'package:demo/ui/demos/7_testing/testing_manager.dart';
import 'package:flutter/material.dart';
import 'package:demo/ui/demos/3_state_management/state_management_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test('color starts on black', () {
  //     final manager = StateManagementManager();
  //     final color = manager.colorNotifier.value;
  //     expect(color, Colors.red);
  // },);
  test('calculator test: adding 2 numbers is correct', () {
    final manager = TestingManager();
    var values = ['1', '2'];
    manager.add(values[0], values[1]);
    final answer = manager.result.value;
    expect(answer, double.parse(values[0]) + double.parse(values[1]));
  },);
  test('calculator test: default result is 0', () {
    final manager = TestingManager();
    final answer = manager.result.value;
    expect(answer, 0);
  },);
}