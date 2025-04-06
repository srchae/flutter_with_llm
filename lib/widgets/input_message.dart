import 'package:flutter/material.dart';

class InputMessage extends StatelessWidget {
  final ValueChanged<String> onSubmit;
  final TextEditingController controller;

  const InputMessage({
    super.key,
    required this.onSubmit,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
      controller: controller,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          height: 24 / 14,
          color: Colors.black),
      decoration: InputDecoration(
        hintText: "Add a Message",
        fillColor: Color(0xFFF7F7FC),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4)),
      ),
      onSubmitted: (value) {
        onSubmit(value);
        controller.clear();
      },
    ));
  }
}
