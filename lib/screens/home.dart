import 'package:flutter/material.dart';
import 'package:n_notes_app/providers/theme.dart';
import 'dart:developer';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../routes/routes.dart';
import '../providers/notes.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final titlectrl = TextEditingController();
  final textctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(noteDBProvider).fetchNotes();
  }

  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 20.h,
          child: Column(
            children: [
              TextField(
                controller: titlectrl,
              ),
              TextField(
                controller: textctrl,
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              ref.read(noteDBProvider).addNote(titlectrl.text, textctrl.text);
              log("CurrNotes:${ref.read(noteDBProvider).notes.toString()}");
              textctrl.clear();
              titlectrl.clear();
              Routes.router.pop();
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  void updateNote(Note note) {
    titlectrl.text = note.title;
    textctrl.text = note.text;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: SizedBox(
          height: 15.h,
          child: Column(
            children: [
              TextField(
                controller: titlectrl,
              ),
              TextField(
                controller: textctrl,
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              ref
                  .read(noteDBProvider)
                  .updateNote(titlectrl.text, textctrl.text, note.key);
              titlectrl.clear();
              textctrl.clear();
              Routes.router.pop();
            },
            child: const Text("Edit"),
          ),
        ],
      ),
    );
  }

  void deleteNote(Note note) {
    ref.read(noteDBProvider).deleteNote(note.key);
  }

  @override
  Widget build(BuildContext context) {
    final notesDB = ref.watch(noteDBProvider);
    final theme = ref.watch(themerProvider);
    final currNotes = notesDB.notes;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        title: Text("NOTES",
            style: TextStyle(
              fontSize: 7.h,
            )),
        actions: [
          theme.dark ? const Text("Dark Mode") : const Text("Light Mode"),
          SizedBox(
            width: 4.w,
          ),
          Switch(
              activeThumbImage: const AssetImage("assets/dark.png"),
              inactiveThumbImage: const AssetImage("assets/light.png"),
              value: theme.dark,
              onChanged: (bool value) {
                theme.toggleTheme();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: currNotes.isEmpty
          ? const Center(
              child: Text(
                "No notes available",
              ),
            )
          : ListView.builder(
              itemCount: currNotes.length,
              itemBuilder: (context, index) {
                final note = currNotes[index];
                return ListTile(
                  title: Text(
                    note.title,
                  ),
                  subtitle: Text(
                    note.text,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => updateNote(note),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => deleteNote(note),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
