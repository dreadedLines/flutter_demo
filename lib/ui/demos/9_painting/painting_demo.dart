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
      body: 
        Center(
          child: CustomPaint( //                       <-- CustomPaint widget
            size: Size(300, 300),
            painter: MyPainter(),
          ),
        ),
    );
  }
}

class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(-100, 0);
    final p2 = Offset(250, 150);
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}