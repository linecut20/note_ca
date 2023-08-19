import 'package:flutter/material.dart';
import 'package:note_ca/data/data_source/sqflite_db.dart';
import 'package:note_ca/data/repository_impl/note_repository_impl.dart';
import 'package:note_ca/ui/design/constrains.dart';
import 'package:note_ca/ui/page/add_note_page/add_note_page_view_model.dart';
import 'package:note_ca/ui/page/main_page/main_page.dart';
import 'package:note_ca/ui/page/main_page/main_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'domain/repository/note_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late NoteRepository repository;

  @override
  void initState() {
    init();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainPageViewModel(repository),
        ),
        ChangeNotifierProvider(
          create: (_) => AddNotePageViewModel(repository),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: darkGrey,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          // useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }

  Future<void> init() async {
    var db = SqfliteDB(await openDatabase('note.db'));
    repository = NoteRepositoryImpl(db);
  }
}
