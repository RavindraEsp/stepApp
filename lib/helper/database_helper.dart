import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static const tableName = "StepRecord";
  static const _databaseName = "MyDatabase.db";

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            startTime TEXT,
            endTime TEXT,
            startStep INTEGER,
            endStep INTEGER,
            isSend INTEGER,
            totalStep INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertRecord(Map<String, dynamic> record) async {
    Database db = await database;
    return await db.insert(tableName, record);
  }

  Future<List<Map<String, dynamic>>> getRecords() async {
    Database db = await database;
    return await db.query(tableName);
  }

  Future<int> deleteRecord(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateRecord(int id, Map<String, dynamic> updatedValues) async {
    Database db = await database;
    return await db.update(tableName, updatedValues, where: 'id = ?', whereArgs: [id]);
  }

}