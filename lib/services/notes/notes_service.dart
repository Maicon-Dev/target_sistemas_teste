import 'dart:convert';

import '../../models/note_model.dart';
import '../firestore_service.dart';

class NoteService extends FirestoreService {
  NoteService() : super('notes');

  Future<void> addNote(Note note) async {
    await addData(note.toMap());
  }

  Future<void> updateNote(Note note) async {
    await updateData(note.id!, note.toMap());
  }

  Future<void> deleteNote(String noteId) async {
    await deleteData(noteId);
  }

  Future<List<Note>?> getNotes(String userId) async {
    final notes = await getDataByUser(userId);

    final List<Note> noteList = [];

    for (var note in notes ?? []) {
      final data = jsonDecode(jsonEncode(note.data()));
      noteList.add(Note(
        id: note.id,
        userId: data['userId'],
        content: data['content'],
      ));
    }

    return noteList;
  }
}
