import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../../models/note_model.dart';
import '../../services/auth/auth_service.dart';
import '../../services/notes/notes_service.dart';

part 'note_store.g.dart';

class NoteStore = NoteStoreBase with _$NoteStore;

abstract class NoteStoreBase with Store {
  final NoteService _noteService = NoteService();
  final AuthService _authService = AuthService();

  @observable
  List<Note>? noteList = ObservableList<Note>();

  @observable
  String? note;

  @action
  void setNote(String value) {
    note = value;
  }

  @action
  void clearNote() {
    note = null;
  }

  @action
  Future<void> createNote() async {
    try {
      final User? userCredentials = _authService.getCurrentUser();
      if (note != null && note != "" && userCredentials != null) {
        final Note noteObject =
            Note(content: note!, userId: userCredentials.uid);
        await _noteService.addNote(noteObject);
      }

      fetchNotes();
      clearNote();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @action
  Future<void> fetchNotes() async {
    try {
      final User? userCredentials = _authService.getCurrentUser();

      if (userCredentials != null) {
        noteList = await _noteService.getNotes(userCredentials.uid);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @action
  Future<void> editNote(Note noteObject) async {
    try {
      if (note != null && note!.isNotEmpty) {
        Note updatedNote = Note(
          content: note!,
          id: noteObject.id,
          userId: noteObject.userId,
        );
        await _noteService.updateNote(updatedNote);
        clearNote();
        fetchNotes();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @action
  Future<void> deleteNote(String noteId) async {
    try {
      await _noteService.deleteNote(noteId);
      await fetchNotes();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
