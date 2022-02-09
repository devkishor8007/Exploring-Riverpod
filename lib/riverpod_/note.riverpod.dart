import 'package:exploring_riverpod/data/db.helper.dart';
import 'package:exploring_riverpod/model/note.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final noteProviders =
    ChangeNotifierProvider<NoteProvider>((ref) => NoteProvider());

class NoteProvider with ChangeNotifier {
  List<NoteModel> _notes = [];
  List<NoteModel> get notes => [..._notes];

  Future get() async {
    _notes = await DatabaseHelper.instance.getNotes();
    notifyListeners();
  }

  Future add(NoteModel noteModel) async {
    _notes.insert(0, noteModel);
    notifyListeners();
    await DatabaseHelper.instance.addNotes(noteModel);
  }

  Future delete(int id) async {
    await DatabaseHelper.instance.deleteNotes(id);
    notifyListeners();
  }

  Future update(NoteModel noteModel) async {
    await DatabaseHelper.instance.updateNotes(noteModel);
    notifyListeners();
  }

  Future deleteAllNotes() async {
    _notes.clear();
    await DatabaseHelper.instance.deleteAllNotes();
    notifyListeners();
  }
}
