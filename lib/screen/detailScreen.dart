import 'package:exploring_riverpod/model/note.model.dart';
import 'package:flutter/material.dart';

class DetailHomeScreen extends StatelessWidget {
  final NoteModel note;
  const DetailHomeScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.name.toString()),
      ),
      body: Text(
        note.desc.toString(),
      ),
    );
  }
}
