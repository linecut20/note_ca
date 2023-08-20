import 'package:flutter/material.dart';
import 'package:note_ca/presentation/page/add_note_page/add_note_page_view_model.dart';
import 'package:note_ca/presentation/page/widget/text_field/content_text_field.dart';
import 'package:note_ca/presentation/page/widget/palette_widget.dart';
import 'package:note_ca/presentation/page/widget/text_field/title_text_field.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        color: Color(context.watch<AddNotePageViewModel>().colorCode),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            PaletteWidget(width: width * 0.15),
            TitleTextField(
              controller: _titleController,
            ),
            Expanded(
              child: ContentTextField(
                controller: _contentController,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}
