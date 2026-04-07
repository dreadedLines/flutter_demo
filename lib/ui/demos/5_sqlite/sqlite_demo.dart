import 'package:flutter/material.dart';

class SqliteDemo extends StatelessWidget {
  const SqliteDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sqflite"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                
              }, 
              child: Text("insert")),
            TextButton(
              onPressed: () {
                
              }, 
              child: Text("query")),
            OutlinedButton(
              onPressed: () {
                
              }, 
              child: Text("update")),
            TextButton(
              onPressed: () {
                
              }, 
              child: Text("delete")),
          ],
        ),
      ),
    );
  }
}