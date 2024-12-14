import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/todo.dart';

class DBService {
  final String _table = 'todos';
  final String _id = 'id';
  final String _title = 'title';

  static final DBService instance = DBService._init();
  static Database? _database;

  DBService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('todos.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_table (
        $_id INTEGER PRIMARY KEY AUTOINCREMENT,
        $_title TEXT NOT NULL
      )
    ''');
  }

  Future<int> addTodo(Todo todo) async {
    final db = await instance.database;
    return await db.insert(
      _table,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> getTodos() async {
    final db = await instance.database;
    final result = await db.query(_table);
    return result.map((map) => Todo.fromMap(map)).toList();
  }

  Future<int> deleteTodo(int id) async {
    final db = await instance.database;
    return await db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateTodo(Todo todo) async {
    final db = await instance.database;
    return await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
