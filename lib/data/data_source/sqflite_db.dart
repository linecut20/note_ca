import 'package:note_ca/domain/model/note.dart';
import 'package:sqflite/sqlite_api.dart';

class SqfliteDB {
  Database db;

  SqfliteDB(this.db);

  Future<Note?> getNoteById(int id) async {
    final result = await db.rawQuery('SELECT * FROM "note" WHERE id = $id');
    if (result.isNotEmpty) {
      return Note.fromJson(result.first);
    } else {
      return null;
    }
  }

  Future<List<Note>> getNotes() async {
    final result = await db.rawQuery('SELECT * FROM "note"');
    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future<void> createNote(Note note) async {
    await db.insert('note', note.toJson());
  }

  Future<void> updateNote(Note note) async {
    await db
        .update('note', note.toJson(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> deleteNoteById(int id) async {
    await db.delete('note', where: 'id = ?', whereArgs: [id]);
  }
}
