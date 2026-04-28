import 'package:flutter/material.dart';
import 'dart:math' as math;
// import 'dart:ui' as ui;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

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
              Container(
                // color: Colors.grey,
                width: 500,
                child: ProgressBar(barColor: Colors.blue, thumbColor: Colors.red, thumbSize: 20.0,)
              )
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
    final path = Path()
      // ..moveTo(50, 50)
      // ..lineTo(200, 250)
      ..moveTo(50, 30)
      ..quadraticBezierTo(0, 200, 150, 100)
      ..quadraticBezierTo(300, 0, 250, 170)
      // ..quadraticBezierTo(0, 0, 100, 200)
      // ..lineTo(10, 200)
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
          _thumbSize = thumbSize {
          
      // initialize the gesture recognizer
      _drag = HorizontalDragGestureRecognizer()
        ..onStart = (DragStartDetails details) {
          _updateThumbPosition(details.localPosition);
        }
        ..onUpdate = (DragUpdateDetails details) {
          _updateThumbPosition(details.localPosition);
        };
    }

  void _updateThumbPosition(Offset localPosition) {
    var dx = localPosition.dx.clamp(0, size.width);
    _currentThumbValue = dx / size.width;
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  Color get barColor => _barColor;
  Color _barColor;
  set barColor(Color value) {
    if (_barColor == value) {return;} // if value doesn't change, don't repaint widget
    _barColor = value;
    markNeedsPaint();
  }
  Color get thumbColor => _thumbColor;
  Color _thumbColor;
  set thumbColor(Color value) {
    if (_thumbColor == value) {return;}
    _thumbColor = value;
    markNeedsPaint();
  }
  double get thumbSize => _thumbSize;
  double _thumbSize;
  set thumbSize(double value) {
    if (_thumbSize == value) {return;} // if value doesn't change, don't remeasure widget
    _thumbSize = value;
    markNeedsLayout();
  }

  // compute size based on parent's constraints
  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }
  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = constraints.maxWidth;
    final desiredHeight = math.min(thumbSize, constraints.maxHeight);
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }  

  // size by default
  static const _minDesiredWidth = 100.0;
  @override
  double computeMinIntrinsicWidth(double height) => _minDesiredWidth;
  @override
  double computeMaxIntrinsicWidth(double height) => _minDesiredWidth;
  @override
  double computeMinIntrinsicHeight(double width) => thumbSize;
  @override
  double computeMaxIntrinsicHeight(double width) => thumbSize;

  // paint the widget
  double _currentThumbValue = 0.5;
  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    // paint bar
    final barPaint = Paint()
      ..color = barColor
      ..strokeWidth = 5;
    final point1 = Offset(0, size.height / 2);
    final point2 = Offset(size.width, size.height / 2);
    canvas.drawLine(point1, point2, barPaint);
    // paint thumb
    final thumbPaint = Paint()..color = thumbColor;
    final thumbDx = _currentThumbValue * size.width;
    final center = Offset(thumbDx, size.height / 2);
    canvas.drawCircle(center, thumbSize / 2, thumbPaint);
    canvas.restore();
  }

  // handle touching the widget
  late HorizontalDragGestureRecognizer _drag;
  @override
  bool hitTestSelf(Offset position) => true;
  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent) {
      _drag.addPointer(event);
    }
  }
}