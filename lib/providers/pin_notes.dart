import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:n_notes_app/models/pin_note.dart';

final pinNoteProvider = ChangeNotifierProvider<PinNotes>((ref) {
  return PinNotes();
});
