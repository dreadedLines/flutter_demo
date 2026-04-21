import 'package:flutter/material.dart';
import 'dart:math' as math;

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
    final rect = Rect.fromLTRB(0, 0, 250, 200);
    final startAngle = math.pi/2;
    final sweepAngle = math.pi*1.2;
    final useCenter = false;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paintSettings);
    final startAngle1 = math.pi*(1/2+1.2);
    final sweepAngle1 = math.pi*(2-1.2);
    canvas.drawArc(rect, startAngle1, sweepAngle1, useCenter, paintSettings1);
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}