import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'login.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }


Future<String> getDatabasesPath() async {
  try {
    return await databaseFactory.getDatabasesPath();
  } catch (e) {
    print('Error: $e');
    return '';
  }
}

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, password TEXT)',
    );
  }

  Future<int> insertUser(String email, String password) async {
    final db = await database;
    return await db.insert(
      'users',
      {
        'email': email,
        'password': password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }
}
