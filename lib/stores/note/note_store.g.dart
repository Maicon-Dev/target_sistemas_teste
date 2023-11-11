// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on NoteStoreBase, Store {
  late final _$noteListAtom =
      Atom(name: 'NoteStoreBase.noteList', context: context);

  @override
  List<Note>? get noteList {
    _$noteListAtom.reportRead();
    return super.noteList;
  }

  @override
  set noteList(List<Note>? value) {
    _$noteListAtom.reportWrite(value, super.noteList, () {
      super.noteList = value;
    });
  }

  late final _$noteAtom = Atom(name: 'NoteStoreBase.note', context: context);

  @override
  String? get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(String? value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  late final _$createNoteAsyncAction =
      AsyncAction('NoteStoreBase.createNote', context: context);

  @override
  Future<void> createNote() {
    return _$createNoteAsyncAction.run(() => super.createNote());
  }

  late final _$fetchNotesAsyncAction =
      AsyncAction('NoteStoreBase.fetchNotes', context: context);

  @override
  Future<void> fetchNotes() {
    return _$fetchNotesAsyncAction.run(() => super.fetchNotes());
  }

  late final _$editNoteAsyncAction =
      AsyncAction('NoteStoreBase.editNote', context: context);

  @override
  Future<void> editNote(Note noteObject) {
    return _$editNoteAsyncAction.run(() => super.editNote(noteObject));
  }

  late final _$deleteNoteAsyncAction =
      AsyncAction('NoteStoreBase.deleteNote', context: context);

  @override
  Future<void> deleteNote(String noteId) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(noteId));
  }

  late final _$NoteStoreBaseActionController =
      ActionController(name: 'NoteStoreBase', context: context);

  @override
  void setNote(String value) {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
        name: 'NoteStoreBase.setNote');
    try {
      return super.setNote(value);
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearNote() {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
        name: 'NoteStoreBase.clearNote');
    try {
      return super.clearNote();
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
noteList: ${noteList},
note: ${note}
    ''';
  }
}
