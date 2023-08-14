import 'package:flutter/material.dart';
import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/domain/repository/note_repository.dart';
import 'package:note_ca/domain/state/note_state.dart';

class MainPageViewModel with ChangeNotifier {
  final NoteRepository noteRepository;
  NoteState _state = NoteState(notes: []);
  List<Note> _notes = [];
  Note? _lastDeletedNote; //Undo 기능용 프로퍼티

  MainPageViewModel(this.noteRepository);

  List<Note> get notes => _notes;
  Note? get lastDeletedNote => _lastDeletedNote;
  NoteState get state => _state;

  loadNotes() async {
    _notes = await noteRepository.getNotes();
    _state = _state.copyWith(notes: _notes);
    notifyListeners();
  }

  deleteNoteById(int id) async {
    await noteRepository.deleteNoteById(id);
    _lastDeletedNote = _notes.firstWhere((note) => note.id == id);
    _notes.removeWhere((note) => note.id == id);

    notifyListeners();
  }

  updateNoteById(Note note) async {
    await noteRepository.updateNote(note);

    notifyListeners();
  }

  undoRemove() async {
    if (_lastDeletedNote != null) {
      await noteRepository.createNote(
        _lastDeletedNote!,
      );
      _notes.add(_lastDeletedNote!);
      _lastDeletedNote = null;
      notifyListeners();
    }
  }
}
