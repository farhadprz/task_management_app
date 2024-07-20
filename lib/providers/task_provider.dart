import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_management_app/models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  late Database _database;

  List<Task> get tasks => _tasks;

  TaskProvider() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      '${await getDatabasesPath()}tasks.db',
      onCreate: (db, version) {
        return db.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)');
      },
      version: 1,
    );

    fetchTasks();
  }

  Future<void> fetchTasks() async {
    final List<Map<String, dynamic>> maps = await _database.query('tasks');
    _tasks = List.generate(
      maps.length,
      (index) => Task.fromMap(maps[index]),
    );

    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    _database.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    await _database.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );

    fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await _database.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

    fetchTasks();
  }
}
