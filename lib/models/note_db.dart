import 'package:hive_flutter/hive_flutter.dart';
import 'package:n_notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDB {
  static Future initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.initFlutter('n_notes');
    Hive.registerAdapter(NoteAdapter());
  }

  List notes = [];

  Future fetchNotes() async {
    var box = await Hive.openBox<Note>('notes');
    List fetchNotes = box.values.toList();
    notes.clear();
    notes.addAll(fetchNotes);
    await box.close();
  }

  Future addNote(String note) async {
    var box = await Hive.openBox<Note>('notes');
    box.add(Note(text: note));
    await fetchNotes();
    await box.close();
  }

  Future updateNote(String newText, int noteId) async {
    var box = await Hive.openBox<Note>('notes');
    Note? existingNote = box.get(noteId);
    if (existingNote != null) {
      var updatedNote = Note(text: newText);
      await box.put(noteId, updatedNote);
      await existingNote.save();
    }
    await fetchNotes();
    await box.close();
  }

  Future deleteNote(int noteId) async {
    var box = await Hive.openBox<Note>('notes');
    await box.delete(noteId);
    await fetchNotes();
    await box.close();
  }
}
