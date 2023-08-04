import 'package:note_ca/domain/model/note.dart';

//Note model에 대한 추상화
//구현은 data/repository에서 구현
abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<Note> getNoteById(String id);

  Future<void> createNode(Note note);

  Future<void> updateNode(Note note);

  Future<void> deleteNodeById(String id);
}
