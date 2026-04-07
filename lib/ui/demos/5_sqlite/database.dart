import 'package:sqflite/sqflite.dart';
import 'package:pat';

class DatabaseHelper {
  static const _dbName = "my_database.db";
  static const _dbVersion = 1;

  static const table = "myTable";
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';

  Future<void> init() async {

  }
}