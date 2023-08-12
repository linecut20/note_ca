import 'package:note_ca/domain/model/note.dart';

//Note model에 대한 추상화
//Model과 관련해서 호출할법한 기능들을 추상화
//구현은 data/repository에서 구현
//폴더 등 경로는 얼마든지 프로젝트의 상황에 맞게 변경이 가능하다 (repository의 경우 추상클래스와 구현클래스를 함께
// 관리하는 것도 괜찮아보임)

abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<Note?> getNoteById(int id);

  Future<void> createNote(Note note);

  Future<void> updateNote(Note note);

  Future<void> deleteNoteById(int id);
}
