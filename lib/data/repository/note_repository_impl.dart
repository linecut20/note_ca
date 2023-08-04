import 'package:note_ca/data/data_source/sqflite_db.dart';
import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final SqfliteDB db;

  NoteRepositoryImpl(this.db);

  @override
  Future<void> createNode(Note note) {
    // TODO: implement createNode
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNodeById(String id) {
    // TODO: implement deleteNodeById
    throw UnimplementedError();
  }

  @override
  Future<Note> getNoteById(String id) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<void> updateNode(Note note) {
    // TODO: implement updateNode
    throw UnimplementedError();
  }
}
