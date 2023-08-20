import 'package:flutter/material.dart';
import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/presentation/page/widget/note_item.dart';

import '../add_note_page/add_note_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Text(
          'Notes',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: Column(
        children: [
          NoteItem(
            note: Note(
                title: 'title',
                content: 'content',
                colorCode: Colors.red.value,
                regdate: DateTime.now()),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNotePage()));
        },
        child: const Icon(Icons.note_add),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
