import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _dbName = "my_database.db";
  static const _dbVersion = 1;

  static const table = "myTable";
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';

  Future<void> init() async {
    final folder = await getApplicationDocumentsDirectory();
    final path = '$folder/$_dbName';
  }
}