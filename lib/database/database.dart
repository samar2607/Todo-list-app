import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DataBaseHelper{
  static final DataBaseHelper instance = DataBaseHelper._instance();
  static Database? _db = null;
  DataBaseHelper._instance();

  String taskTable = 'task_table';
  String colId = 'id';
  String colName = 'name';
  String colIsDone = 'isDone';

  Future<Database?> get db async{
    if(_db == null){
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'todo_list.db';
    final todoListDB = await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDB;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $taskTable('
          '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
          '$colName TEXT,'
          '$colIsDone TEXT);'
    );
  }
}