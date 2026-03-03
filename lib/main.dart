import 'dart:io';
import 'package:flutter/material.dart';

import './services/service_locator.dart';
import 'ui/1_dart/dart_demo_screen.dart';
import 'ui/2_widget_layout/widgets_demo_screen.dart';
import 'ui/3_state_management/state_management_demo.dart';

void main() {
  setupServiceLocator();
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
          ListTile(
            title: const Text("3. State management"),
            leading: const Icon(Icons.air),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StateManagementDemo())
              );
            }
          )
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