import 'package:flutter/material.dart';
import 'package:note_ca/ui/design/constrains.dart';
import 'package:note_ca/ui/page/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          scaffoldBackgroundColor: darkGrey
          // useMaterial3: true,
          ),
      home: const MainPage(),
    );
  }
}
