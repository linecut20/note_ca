import 'package:flutter/material.dart';
import 'package:note_ca/presentation/page/add_note_page/add_note_page.dart';
import 'package:note_ca/presentation/page/main_page/main_page_view_model.dart';
import 'package:note_ca/presentation/page/widget/note_item.dart';
import 'package:provider/provider.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              context.watch<MainPageViewModel>().notes.length,
              (index) => NoteItem(
                    note: context.watch<MainPageViewModel>().notes[index],
                  )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNotePage()),
          ).then((result) {
            if (result) {
              context.read<MainPageViewModel>().loadNotes();
            }
          });
        },
        child: const Icon(Icons.note_add),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
