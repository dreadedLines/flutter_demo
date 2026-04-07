import 'package:demo/services/service_locator.dart';
import 'package:demo/ui/demos/5_sqlite/database.dart';
import 'package:flutter/material.dart';

class SqliteDemo extends StatefulWidget {
  const SqliteDemo({super.key});

  @override
  State<SqliteDemo> createState() => _SqliteDemoState();
}

class _SqliteDemoState extends State<SqliteDemo> {
  final db = getIt<DatabaseHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sqflite"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final row = {
                  DatabaseHelper.columnName: "Bair",
                  DatabaseHelper.columnAge: 20,
                };
                await db.insert(row);
              }, 
              child: Text("insert")),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () async {
                final allRows = await db.queryAllRows();
                debugPrint('query all rows:');
                for (final row in allRows) {
                  debugPrint(row.toString());
                }
              }, 
              child: Text("query"),
              // style: ButtonStyle(),
            ),
            const SizedBox(height: 20,),
            OutlinedButton(
              onPressed: () async {
                Map<String, dynamic> row = {
                  DatabaseHelper.columnId: 1,
                  DatabaseHelper.columnName: 'Mary',
                  DatabaseHelper.columnAge: 32
                };
                final rowsAffected = await db.update(row);
                debugPrint('updated $rowsAffected row(s)');
              }, 
              child: Text("update")),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () async {
                final id = await db.queryRowCount();
                final rowsDeleted = await db.delete(id);
                debugPrint('deleted $rowsDeleted row(s): row $id');
              }, 
              child: Text("delete")),
          ],
        ),
      ),
    );
  }
}