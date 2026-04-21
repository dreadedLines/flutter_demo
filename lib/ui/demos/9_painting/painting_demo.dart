import 'package:flutter/material.dart';
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
            child: CustomPaint( //                       <-- CustomPaint widget
              size: Size(300, 300),
              painter: MyPainter(),
            ),
          )
        ),
    );
  }
}

class MyPainter extends CustomPainter { //         <-- CustomPainter class
  final paintSettings = Paint()
  ..color = Colors.black
  ..style = PaintingStyle.fill
  ..strokeWidth = 10;
  @override
  void paint(Canvas canvas, Size size) {
    final left = -60.0;
    final top = -100.0;
    final right = 350.0;
    final bottom = 200.0;
    final rect = Rect.fromLTRB(left, top, right, bottom);
    canvas.drawRect(rect, paintSettings);
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}