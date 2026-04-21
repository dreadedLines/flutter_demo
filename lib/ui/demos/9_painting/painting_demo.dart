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
    final path = Path()
      ..moveTo(50, 50)
      ..lineTo(200, 250)
      ..quadraticBezierTo(200, 0, 150, 100)
      ..quadraticBezierTo(0, 0, 100, 200)
      ..lineTo(10, 200)
      ;
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}