import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  final TextEditingController controller;
  const TitleTextField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: 'Enter title',
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
    );
  }
}
