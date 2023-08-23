import 'package:flutter/material.dart';
import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/domain/repository/note_repository.dart';
import 'package:note_ca/presentation/design/constrains.dart';

class AddNotePageViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _colorCode = roseBud.value;
  int get colorCode => _colorCode;

  AddNotePageViewModel(this.repository);

  Future<void> changeColor(int colorCode) async {
    _colorCode = colorCode;
    notifyListeners();
  }

  Future<bool> saveNote(
      {int? id, required String title, required String content}) async {
    try {
      //최초 생성의 경우
      if (id == null) {
        repository.createNote(Note(
            title: title,
            content: content,
            colorCode: _colorCode,
            regdate: DateTime.now()));
      } else {
        //update의 경우
        repository.updateNote(Note(
          id: id,
          title: title,
          content: content,
          colorCode: _colorCode,
          regdate: DateTime.now(),
        ));
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
