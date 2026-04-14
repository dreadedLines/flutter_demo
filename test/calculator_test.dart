import 'package:demo/ui/demos/7_testing/testing_manager.dart';
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
  test('calculator test: user inputs invalid value', () {
    final manager = TestingManager();
    expect(() => manager.add('abc', '2'), throwsFormatException);
    expect(() => manager.add('65', 'b'), throwsFormatException);
  },);
}