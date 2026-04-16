import 'package:demo/ui/demos/2_widget_layout/widgets_demo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('another test: some widgets exist', (tester) async {
    await tester.pumpWidget(MaterialApp(home: WidgetsLayoutDemo(),));
    final textWidget = find.text("World");
    expect(textWidget, findsOneWidget);

    final textWidget2 = find.text("kadjasdisajdas");
    expect(textWidget2, findsNothing);

    final buttonWidget = find.byType(OutlinedButton);
    expect(buttonWidget, findsOne);
  });
}