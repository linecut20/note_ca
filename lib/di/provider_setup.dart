import 'package:note_ca/data/data_source/sqflite_db.dart';
import 'package:note_ca/data/repository_impl/note_repository_impl.dart';
import 'package:sqflite/sqflite.dart';

//init providers
Future<NoteRepositoryImpl> getNoteRepository() async {
  //db init
  SqfliteDB db = SqfliteDB(
    await openDatabase(
      'note.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color_code INTEGER, regdate INTEGER)',
        );
      },
    ),
  );

  //repository init
  return NoteRepositoryImpl(db);
}
