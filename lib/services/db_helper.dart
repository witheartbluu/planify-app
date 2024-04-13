import 'package:flutter/foundation.dart';
import 'package:planify/dto/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _db;

  factory DBHelper() => _instance;

  DBHelper._internal();

  Future<Database> get db async {
    _db ??= await initDatabase();
    return _db!;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'db_todo.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT)');
  }

  Future<ToDo> add(ToDo todo) async {
    var dbClient = await db;
    todo.id = await dbClient.insert('todo', todo.toMap());
    return todo;
  }

  Future<List<ToDo>> getTodos() async { // Plural for clarity
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query('todo', orderBy: 'id DESC');
    List<ToDo> todos = []; // Use plural consistently
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        todos.add(ToDo.fromMap(maps[i]));
      }
    }
    return todos;
  }

  Future<int> update(ToDo todo) async {
    var dbClient = await db;
    return await dbClient.update(
      'todo',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    try {
      var dbClient = await db;
      _db = null;
      await dbClient.close();
    } catch (error) {
      debugPrint('Error closing database: $error');
    }
  }
}
