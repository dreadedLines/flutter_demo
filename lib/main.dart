import 'package:flutter/material.dart';
import './dart_demo_screen.dart';
import './widgets_demo_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // A ListView for your items
      body: ListView(
        children: [
          // The single list item requested
          ListTile(
            title: const Text("1. Button"),
            leading: const Icon(Icons.code), // Optional: adds a little icon
            onTap: () {
              // Navigate to the new screen defined in the other file
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DartDemoScreen()),
              );
            },
          ),
          ListTile(
            title: const Text("2. Another"),
            leading: const Icon(Icons.code), // Optional: adds a little icon
            onTap: () {
              // Navigate to the new screen defined in the other file
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WidgetsLayoutDemo()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DraggableContainer extends StatelessWidget {
  const DraggableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}