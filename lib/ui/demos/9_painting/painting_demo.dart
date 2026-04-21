import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.lime)),
                child: CustomPaint( 
                  size: Size(300, 300),
                  painter: MyPainter(),
                ),
              ),
              
            ],
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

class ProgressBar extends LeafRenderObjectWidget {
  const ProgressBar({
    Key? key,
    required this.barColor,
    required this.thumbColor,
    this.thumbSize = 20.0,
    }) : super(key: key);

    final Color barColor;
    final Color thumbColor;
    final double thumbSize;

    @override
    RenderProgressBar createRenderObject(BuildContext context) {
      return RenderProgressBar(
        barColor: barColor,
        thumbColor: thumbColor,
        thumbSize: thumbSize,
      );
    }

    @override
    void updateRenderObject(BuildContext context, RenderProgressBar renderObject) {
      renderObject
        ..barColor = barColor
        ..thumbColor = thumbColor
        ..thumbSize = thumbSize;
    }

    @override
    void debugFillProperties(DiagnosticPropertiesBuilder properties) {
      super.debugFillProperties(properties);
      properties.add(ColorProperty('barColor', barColor));
      properties.add(ColorProperty('thumbColor', thumbColor));
      properties.add(DoubleProperty('thumbSize', thumbSize));
    }
}

class RenderProgressBar extends RenderBox {
  RenderProgressBar({
    required Color barColor,
    required Color thumbColor,
    required double thumbSize,
  })  : _barColor = barColor,
      _thumbColor = thumbColor,
      _thumbSize = thumbSize;

  Color get barColor => _barColor;
  Color _barColor;
  set barColor(Color value) {
    if (_barColor == value) //  
      return;
    _barColor = value;
    markNeedsPaint();
  }
}