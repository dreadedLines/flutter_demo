import 'package:flutter/material.dart';

class DartDemoScreen extends StatelessWidget {
  const DartDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1. Buttons"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Center aligns the scroll view in the middle of the screen
      body: Center(
        // SingleChildScrollView ensures the content scrolls if the screen is too small
        child: SingleChildScrollView(
          child: Column(
            // MainAxisSize.min ensures the column only takes up needed space
            // so the Center widget can do its job vertically
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(onPressed: () {print("A");}, child: const Text("Button 1")),
              const SizedBox(height: 10), // Spacing between buttons
              ElevatedButton(onPressed: () {
                var birthyear = 2011;
                var speed = "fast";

                if (birthyear > 2000) {
                  print("Dart was made in the new century");
                } else if (birthyear < 2000) {
                  print("It's the 20-th century");
                } else {
                  print("It's the year 2000");
                } 
              }, child: const Text("Button 2")),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                
              }, child: const Text("Button 3")),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                
              }, child: const Text("Button 4")),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                
              }, child: const Text("Button 5")),
            ],
          ),
        ),
      ),
    );
  }
}