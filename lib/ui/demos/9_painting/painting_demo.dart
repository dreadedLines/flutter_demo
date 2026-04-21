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
  ..color = Colors.orange
  ..style = PaintingStyle.fill
  ..strokeWidth = 10;
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(150, 50, 400, 200);
    canvas.drawOval(rect, paintSettings);
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}