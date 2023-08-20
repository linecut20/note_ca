import 'package:flutter/material.dart';

class ContentTextField extends StatelessWidget {
  final TextEditingController controller;
  const ContentTextField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: 'Enter content',
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
    );
  }
}
