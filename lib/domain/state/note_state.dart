import 'package:note_ca/domain/model/note.dart';

class NoteState {
  late List<Note> notes;

  NoteState({required this.notes});

  NoteState copyWith({required List<Note> notes}) {
    return NoteState(notes: notes);
  }
}
