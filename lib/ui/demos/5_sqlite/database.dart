// source: https://suragch.medium.com/simple-sqflite-database-example-in-flutter-e56a5aaa3f91
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// DartError: MissingPluginException(No implementation found for method getApplicationDocumentsDirectory on channel plugins.flutter.io/path_provider)

class DatabaseHelper {
  static const _dbName = "my_database.db";
  static const _dbVersion = 1;

  static const table = "myTable";
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';

  late Database _db;

  Future<void> init() async {
  //   // final folder = await getApplicationDocumentsDirectory();
  //   // final path = join(folder.path, _dbName);
  //   Database _db = await openDatabase(
  //     path,
  //     version: _dbVersion,
  //     onCreate: _onCreate,
  //     onUpgrade: _onUpgrade,
  //   );
  }

  Future _onCreate(Database db, int version) async {
    final query = '''
      CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columnAge INTEGER NOT NULL
      );
    ''';
    await db.execute(query);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // if (ol)
    // TODO: fix this to ALTER TABLE ADD COLUMN $columnEmail
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await _db.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    return await _db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

}