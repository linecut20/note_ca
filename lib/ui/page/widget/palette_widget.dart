import 'package:flutter/material.dart';
import 'package:note_ca/ui/design/constrains.dart';
import 'package:note_ca/ui/page/add_note_page/add_note_page_view_model.dart';
import 'package:provider/provider.dart';

final palette = [
  roseBud,
  primrose,
  wisteria,
  skyBlue,
  illusion,
];

class PaletteWidget extends StatelessWidget {
  final double width;
  const PaletteWidget({required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        palette.length,
        (index) => ColorItem(
          width: width,
          color: palette[index],
        ),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final Color color;
  final double width;
  const ColorItem({required this.width, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<AddNotePageViewModel>().changeColor(color.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: width,
        height: width,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
              color:
                  context.watch<AddNotePageViewModel>().colorCode == color.value
                      ? darkGrey
                      : Colors.transparent,
              width: 3),
        ),
      ),
    );
  }
}
