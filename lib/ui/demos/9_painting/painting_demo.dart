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
    final pointMode = ui.PointMode.points;
    final points = [
      Offset(500, 100),
      Offset(150, 70),
      Offset(250, 250),
      Offset(130, 200),
      Offset(270, 100),
    ];
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
    final points1 = [
      Offset(510, 100),
      Offset(150, 75),
      Offset(250, 250),
      Offset(200, 200),
      Offset(300, 100),
    ];
    final paint1 = Paint()
      ..color = Colors.green
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points1, paint1);
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}