import 'package:flutter/material.dart';
import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/domain/repository/note_repository.dart';

class AddNotePageViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _colorCode = Colors.orange.value;
  int get colorCode => _colorCode;

  AddNotePageViewModel({required this.repository});

  Future<void> changeColor(int colorCode) async {
    _colorCode = colorCode;
    notifyListeners();
  }

  Future<void> saveNote(int? id, String title, String content) async {
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
  }
}
