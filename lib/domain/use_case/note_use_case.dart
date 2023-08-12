import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/domain/repository/note_repository.dart';

//Use case
//클린 아키텍쳐에서 기능 부분을 담당하는 부분
//추상부의 repository -> 구현부인 repository_impl -> Use case(기능 호출 또는 활용) -> presentation
//ui, page 등을 presentation이라고 하기도 하는데 이 프로젝트에선 presentation을 ui로 표현

class NoteUseCase {
  final NoteRepository _noteRepository;

  NoteUseCase(this._noteRepository);

  Future<List<Note>> getNotes() async {
    return await _noteRepository.getNotes();
  }

  Future<Note?> getNoteById(int id) async {
    return await _noteRepository.getNoteById(id);
  }

  Future<void> createNote(Note note) async {
    await _noteRepository.createNote(note);
  }

  Future<void> updateNoteById(Note note) async {
    await _noteRepository.updateNote(note);
  }

  Future<void> deleteNoteById(int id) async {
    await _noteRepository.deleteNoteById(id);
  }
}
