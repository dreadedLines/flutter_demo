import 'package:flutter/material.dart';

class LocalisationDemo extends StatefulWidget {
  const LocalisationDemo({super.key});

  @override
  State<LocalisationDemo> createState() => _LocalisationDemoState();
}

class _LocalisationDemoState extends State<LocalisationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Localisation demo"),),
      body: Center(
        child: Text("Hello world", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}