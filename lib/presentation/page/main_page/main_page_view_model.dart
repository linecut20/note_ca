import 'package:flutter/material.dart';
import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/domain/repository/note_repository.dart';

class MainPageViewModel with ChangeNotifier {
  final NoteRepository noteRepository;
  List<Note> _notes = [];
  Note? _lastDeletedNote; //Undo 기능용 프로퍼티

  MainPageViewModel(this.noteRepository) {
    loadNotes();
  }

  List<Note> get notes => _notes;
  Note? get lastDeletedNote => _lastDeletedNote;

  loadNotes() async {
    _notes = await noteRepository.getNotes();
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
