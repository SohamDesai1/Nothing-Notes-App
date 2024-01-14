import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:n_notes_app/models/note_db.dart';

final noteDBProvider = ChangeNotifierProvider<NoteDB>((ref) {
  return NoteDB();
});