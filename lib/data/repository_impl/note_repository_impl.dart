import 'package:note_ca/data/data_source/sqflite_db.dart';
import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/domain/repository/note_repository.dart';

//domain 부분에서의 repository의 실질적인 구현부

class NoteRepositoryImpl implements NoteRepository {
  final SqfliteDB db;

  NoteRepositoryImpl(this.db);

  @override
  Future<void> createNote(Note note) async {
    await db.createNote(note);
  }

  @override
  Future<List<Note>> getNotes() async => await db.getNotes();

  @override
  Future<Note?> getNoteById(int id) async => await db.getNoteById(id);

  @override
  Future<void> deleteNoteById(int id) async {
    await db.deleteNoteById(id);
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}
