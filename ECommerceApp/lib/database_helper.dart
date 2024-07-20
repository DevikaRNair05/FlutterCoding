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
    await db.execute(
      'CREATE TABLE orders(orderId INTEGER PRIMARY KEY,email TEXT, total DECIMAL, status TEXT)',
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

  Future<List<Map<String, dynamic>>> getCartItems() async {
    // Get cart items from the database
    return [
      {'productName': 'Mango', 'quantity': 1, 'price': 129.00},
      {'productName': 'Orange', 'quantity': 1, 'price': 100.00},
      {'productName': 'Rice', 'quantity': 5, 'price': 50.00},
      {'productName': 'Oil', 'quantity': 1, 'price': 160.00},
    ];
  }

  Future<void> updateCartItemQuantity(int id, int newQuantity) async {
    final db = await database;
    await db.update(
      'cart', // Table name
      {'quantity': newQuantity}, // Updated values
      where: 'id = ?', // Condition
      whereArgs: [id], // Condition arguments
    );
  }

  Future<List<Map<String, dynamic>>> getOrders() async {
    // final db = await database;
    // return await db.query(
    //   'orders', // Table name
    //   where: 'email = ?', // Condition
    //   whereArgs: [email], // Condition arguments
    // );
    return [
      {'orderId': '405-0984479-3669918', 'status': 'Shipped', 'total': 1029.00},
      {
        'orderId': '405-1027984-1859541',
        'status': 'Delivered',
        'total': 899.00
      },
      {
        'orderId': '405-7373041-9733967',
        'status': 'Cancelled',
        'total': 393.00
      },
    ];
  }
}
