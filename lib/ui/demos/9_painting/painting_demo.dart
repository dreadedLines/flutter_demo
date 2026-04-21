import 'package:flutter/material.dart';

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
  ..color = Colors.black
  ..style = PaintingStyle.fill
  ..strokeWidth = 10;
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(150, 150);
    final radius = 100.0;
    canvas.drawCircle(center, radius, paintSettings);
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}