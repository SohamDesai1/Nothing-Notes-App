import 'package:flutter/material.dart';
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
        content: TextField(
          controller: textctrl,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              ref.read(noteDBProvider).addNote(textctrl.text);
              log("CurrNotes:${ref.read(noteDBProvider).notes.toString()}");
              Routes.router.pop();
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  void updateNote(Note note) {
    textctrl.text = note.text;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: TextField(
          controller: textctrl,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              ref.read(noteDBProvider).updateNote(textctrl.text, note.key);
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
    final currNotes = notesDB.notes;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        title: Text("NOTES", style: TextStyle(fontSize: 7.h)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: currNotes.isEmpty
          ? const Center(
              child: Text("No notes available"),
            )
          : ListView.builder(
              itemCount: currNotes.length,
              itemBuilder: (context, index) {
                final note = currNotes[index];
                return ListTile(
                  title: Text(
                    note.text,
                    style: const TextStyle(color: Colors.white),
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
