import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:n_notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDB extends ChangeNotifier {
  List<Note> notes = [];
  List<Note> get allnotes => notes;

  static Future initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.initFlutter('n_notes');
    Hive.registerAdapter(NoteAdapter());
  }

  Future<void> fetchNotes() async {
    var box = await Hive.openBox<Note>('notes');
    List<Note> fetchNotes = box.values.toList();
    notes = fetchNotes;
    debugPrint("Notes:${notes.map((e) => e.title).toString()}");
    notifyListeners();
    await box.close();
  }

  Future<void> addNote(String title, String note) async {
    var box = await Hive.openBox<Note>('notes');
    box.add(Note(text: note, title: title));
    await box.close();
    await fetchNotes();
  }

  Future<void> updateNote(String title, String newText, int noteId) async {
    var box = await Hive.openBox<Note>('notes');
    Note? existingNote = box.get(noteId);

    if (existingNote != null) {
      var updatedNote = Note(text: newText, title: title);
      await box.put(noteId, updatedNote);
    }

    await box.close();
    await fetchNotes();
  }

  Future<void> deleteNote(int noteId) async {
    var box = await Hive.openBox<Note>('notes');
    await box.delete(noteId);
    await box.close();
    await fetchNotes();
  }
}
