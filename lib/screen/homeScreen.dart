import 'package:exploring_riverpod/data/db.helper.dart';
import 'package:exploring_riverpod/model/note.model.dart';
import 'package:exploring_riverpod/riverpod_/note.riverpod.dart';
import 'package:exploring_riverpod/riverpod_/stringText_riverpod.dart';
import 'package:exploring_riverpod/route.dart';
import 'package:exploring_riverpod/screen/detailScreen.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final descProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appname = ref.watch(appNameRiverpod);

    final name = ref.watch(nameProvider);
    final desc = ref.watch(descProvider);

    final notes = ref.watch(noteProviders);

    return Scaffold(
      appBar: makeAppBar(appname, context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => addData(name, desc, context, notes),
            heroTag: null,
          ),
          SizedBox(
            width: 19,
          ),
          FloatingActionButton(
            heroTag: null,
            tooltip: "Delete All Notes",
            child: Icon(Icons.delete),
            onPressed: () async {
              await notes.deleteAllNotes();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Delete All Notes Successfully'),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<NoteModel>>(
        future: DatabaseHelper.instance.getNotes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Loading'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var nameFirstWord = snapshot.data![index].name
                  .toString()
                  .substring(0, 1)
                  .toUpperCase();
              return GestureDetector(
                onDoubleTap: () {
                  push(context, DetailHomeScreen(note: snapshot.data![index]));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(nameFirstWord.toString()),
                  ),
                  title: Text(
                    snapshot.data![index].name.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    snapshot.data![index].desc.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  // delete single notes
                  onLongPress: () =>
                      deleteNotes(notes, snapshot, index, context),
                  onTap: () =>
                      updateNotes(context, name, desc, notes, snapshot, index),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void addData(name, desc, context, notes) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Me"),
            actions: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Enter Title",
                ),
              ),
              TextField(
                controller: desc,
                decoration: InputDecoration(
                  hintText: "Enter Description",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      pop(context);
                    },
                    color: Colors.pink,
                    textColor: Colors.white,
                  ),
                  MaterialButton(
                    child: Text('Add'),
                    color: Colors.pink,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (name.text.isEmpty || desc.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Please Add Fields"),
                              );
                            });
                      } else {
                        notes.add(NoteModel(name: name.text, desc: desc.text));
                        name.clear();
                        desc.clear();
                        pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }

  void updateNotes(context, name, desc, notes, snapshot, index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update"),
            actions: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Enter Name",
                ),
              ),
              TextField(
                controller: desc,
                decoration: InputDecoration(
                  hintText: "Enter Description",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      pop(context);
                    },
                    color: Colors.pink,
                    textColor: Colors.white,
                  ),
                  MaterialButton(
                    child: Text('Update'),
                    color: Colors.pink,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (name.text.isEmpty || desc.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Please Add Fields"),
                              );
                            });
                      } else {
                        notes.update(NoteModel(
                            id: snapshot.data![index].id,
                            name: name.text,
                            desc: desc.text));
                        name.clear();
                        desc.clear();
                        pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }

  deleteNotes(notes, AsyncSnapshot snapshot, index, context) {
    notes.delete(int.parse(snapshot.data![index].id.toString()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Delete Successfully'),
      ),
    );
  }

  AppBar makeAppBar(String appname, BuildContext context) {
    return AppBar(
      title: Text(
        appname,
        style: buildTextStyle(
          context,
          color: Colors.black,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }
}
