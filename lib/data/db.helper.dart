import 'dart:async';
import 'dart:io';

import 'package:exploring_riverpod/model/note.model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'note.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE note(id INTEGER PRIMARY KEY, name TEXT, desc TEXT)
    ''');
  }

  Future<List<NoteModel>> getNotes() async {
    Database db = await instance.database;
    var notes = await db.query('note', orderBy: 'name');
    List<NoteModel> noteList =
        notes.isNotEmpty ? notes.map((e) => NoteModel.fromMap(e)).toList() : [];
    return noteList;
  }

  Future<int> addNotes(NoteModel noteModel) async {
    Database db = await instance.database;
    return await db.insert('note', noteModel.toMap());
  }

  Future<int> updateNotes(NoteModel noteModel) async {
    Database db = await instance.database;
    return await db.update('note', noteModel.toMap(),
        where: 'id= ?', whereArgs: [noteModel.id]);
  }

  Future<int> deleteNotes(int id) async {
    Database db = await instance.database;
    return await db.delete('note', where: 'id=?', whereArgs: [id]);
  }

  Future<int> deleteAllNotes() async {
    Database db = await instance.database;
    return await db.delete('note');
  }
}
