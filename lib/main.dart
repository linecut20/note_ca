import 'package:flutter/material.dart';
import 'package:note_ca/di/provider_setup.dart';
import 'package:note_ca/presentation/design/constrains.dart';
import 'package:note_ca/presentation/page/main_page/main_page.dart';
import 'package:provider/provider.dart';

import 'presentation/page/add_note_page/add_note_page_view_model.dart';
import 'presentation/page/main_page/main_page_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = await getNoteRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainPageViewModel(repository),
        ),
        ChangeNotifierProvider(
          create: (_) => AddNotePageViewModel(repository),
        ),
      ],
      child: const NoteApp(),
    ),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
