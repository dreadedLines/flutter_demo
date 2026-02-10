import 'package:flutter/material.dart';

void main() {
    runApp(FlutterDemoApp());
}

class FlutterDemoApp extends StatelessWidget {
  const FlutterDemoApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(home: const HomeScreen(), debugShowCheckedModeBanner: false,);
    }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Hello world"), backgroundColor: Color(0xFF000000), foregroundColor: Color(0xAAFFFFFF),), body: Center(child: Text("Hello again", style: const TextStyle(color: Color(0xFFAB00EF), fontFamily: "Roboto", fontSize: 20, shadows: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        blurRadius: 20,
        spreadRadius: -7,
        offset: Offset(0, 60),
      )
  ]) ),) ,);
  }
}

class DraggableContainer extends StatelessWidget {
  const DraggableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}