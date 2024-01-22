import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'note.dart';

class PinNotes extends ChangeNotifier {
  List<Note> _pinnedNotes = [];

  List<Note> get pinnedNotes => _pinnedNotes;

  Future<void> fetchPin() async {
    var box = await Hive.openBox<Note>('pinNotes');
    List<Note> fetchNotes = box.values.toList();
    _pinnedNotes = fetchNotes;
    debugPrint(_pinnedNotes.toString());
    notifyListeners();
    await box.close();
  }

  Future<void> addPin(Note note) async {
    var box = await Hive.openBox<Note>('pinNotes');
    box.add(note);
    note.isPinned = !note.isPinned;
    
    await box.close();
    await fetchPin();
  }

  Future<void> removePin(Note note) async {
    var box = await Hive.openBox<Note>('pinNotes');
    await box.delete(note.key);
    note.isPinned = !note.isPinned;
    await box.close();
    await fetchPin();
  }
}
