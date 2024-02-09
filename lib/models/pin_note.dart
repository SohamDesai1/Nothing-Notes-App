import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:n_notes_app/models/note.dart';
import 'package:n_notes_app/models/note_db.dart';

class PinNotes extends ChangeNotifier {
  List<Note> _pinnedNotes = [];
  List<Note> get pinnedNotes => _pinnedNotes;

  NoteDB notesDB = NoteDB();

  Future<void> fetchPin() async {
    var box = await Hive.openBox<Note>('pinNotes');
    _pinnedNotes = box.values.where((note) => note.isPinned == true).toList();
    debugPrint("Pinned:${_pinnedNotes.map((e) => e.title).toString()}");
    notifyListeners();
    await box.close();
  }

  Future<void> addPin(Note note) async {
    if (!note.isPinned) {
      note.isPinned = true;
      var box = await Hive.openBox<Note>('pinNotes');
      box.add(Note(
        title: note.title,
        text: note.text,
        isPinned: true,
      ));
      notesDB.notes.remove(note);
      await notesDB.fetchNotes();
      await box.close();
      await fetchPin();
    }
  }

  Future<void> removePin(Note note) async {
    if (note.isPinned) {
      note.isPinned = false;
      var box = await Hive.openBox<Note>('pinNotes');
      var pinnedNote = box.values.firstWhere((n) => n.key == note.key);
      await box.delete(pinnedNote.key);
      notesDB.notes.add(note);
      await notesDB.fetchNotes();
      await box.close();
      await fetchPin();
    }
  }
}
