import 'package:flutter/material.dart';
import 'package:note_ca/core/common_function.dart';
import 'package:note_ca/domain/model/note.dart';
import 'package:note_ca/presentation/page/add_note_page/add_note_page_view_model.dart';
import 'package:note_ca/presentation/page/widget/text_field/content_text_field.dart';
import 'package:note_ca/presentation/page/widget/palette_widget.dart';
import 'package:note_ca/presentation/page/widget/text_field/title_text_field.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatefulWidget {
  final Note? note;

  const AddNotePage({this.note, super.key});

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.note != null) {
        _titleController.text = widget.note!.title;
        _contentController.text = widget.note!.content;
        context
            .read<AddNotePageViewModel>()
            .changeColor(widget.note!.colorCode);
      }
    });

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
        onPressed: () {
          if (_titleController.text.trim().toString().isEmpty) {
            CommonFunction.showSnackBar(context, 'Title is empty');
            return;
          }

          if (_contentController.text.trim().toString().isEmpty) {
            CommonFunction.showSnackBar(context, 'Content is empty');
            return;
          }

          final title = _titleController.text.trim().toString();
          final content = _contentController.text.trim().toString();

          context
              .read<AddNotePageViewModel>()
              .saveNote(
                id: widget.note?.id,
                title: title,
                content: content,
              )
              .then((value) {
            if (!value) {
              //fail
              CommonFunction.showSnackBar(context, 'Note save failed');
            } else {
              _titleController.clear();
              _contentController.clear();
              CommonFunction.showSnackBar(context, 'Note saved');

              Navigator.pop(context, true);
            }
          });
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
