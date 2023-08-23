import 'package:flutter/material.dart';
import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/presentation/page/add_note_page/add_note_page.dart';
import 'package:note_ca/presentation/page/main_page/main_page_view_model.dart';
import 'package:provider/provider.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Function? deleteButtonTap;
  const NoteItem({super.key, required this.note, this.deleteButtonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AddNotePage(
              note: note,
            );
          },
        ),
      ).then((result) {
        if (result) {
          context.read<MainPageViewModel>().loadNotes();
        }
      }),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(note.colorCode)),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    note.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () => deleteButtonTap,
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
