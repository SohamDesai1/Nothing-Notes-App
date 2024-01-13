// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../routes/routes.dart';
import '../providers/notes.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final notesDB = ref.watch(noteDBProvider);

    @override
    void initState() {
      super.initState();
      notesDB.fetchNotes();
    }

    final textctrl = TextEditingController();
    List currNotes = notesDB.notes;
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
                    notesDB.addNote(textctrl.text);
                    print("CurrNotes:${currNotes.toString()}");
                    Routes.router.pop();
                  },
                  child: const Text("Create"))
            ]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        // backgroundColor: Colors.black,
        title: Text("NOTES", style: TextStyle(fontSize: 7.h)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: notesDB.fetchNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: notesDB.notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    currNotes[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
