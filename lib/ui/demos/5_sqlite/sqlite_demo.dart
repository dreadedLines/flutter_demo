import 'package:flutter/material.dart';

class SqliteDemo extends StatefulWidget {
  const SqliteDemo({super.key});

  @override
  State<SqliteDemo> createState() => _SqliteDemoState();
}

class _SqliteDemoState extends State<SqliteDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sqflite"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                
              }, 
              child: Text("insert")),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () {
                
              }, 
              child: Text("query"),
              // style: ButtonStyle(),
            ),
            const SizedBox(height: 20,),
            OutlinedButton(
              onPressed: () {
                
              }, 
              child: Text("update")),
            const SizedBox(height: 20,),
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