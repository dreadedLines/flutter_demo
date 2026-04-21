import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class PaintingDemo extends StatefulWidget {
  const PaintingDemo({super.key});

  @override
  State<PaintingDemo> createState() => _PaintingDemoState();
}

class _PaintingDemoState extends State<PaintingDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
        Center(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.lime)),
            child: CustomPaint( 
              size: Size(300, 300),
              painter: MyPainter(),
            ),
          )
        ),
    );
  }
}

class MyPainter extends CustomPainter {
  final paintSettings = Paint()
  ..color = Colors.cyanAccent
  ..style = PaintingStyle.fill
  ..strokeWidth = 10;
  final paintSettings1 = Paint()
  ..color = Colors.black
  ..style = PaintingStyle.fill
  ..strokeWidth = 4;
  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = ui.TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    final paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText('Hello, world.');
    final constraints = ui.ParagraphConstraints(width: 300);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    final offset = Offset(50, 100);
    canvas.drawParagraph(paragraph, offset);
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}