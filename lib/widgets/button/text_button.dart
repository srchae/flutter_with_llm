import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(
            color: Colors.green,
            strokeAlign: 12,
          ),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        child: Text('TextButton'));
  }
}
