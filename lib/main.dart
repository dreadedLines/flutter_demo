import 'package:flutter/material.dart';

void main() {
    runApp(FlutterDemoApp());
}

class FlutterDemoApp extends StatelessWidget {
  const FlutterDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(color: Color(0xFF00FFAA), strokeWidth: 8,);
  }
}