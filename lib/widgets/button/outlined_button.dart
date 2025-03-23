import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.green)),
        child: Text(
          'OutlinedButton',
          style: TextStyle(color: Colors.green),
        ));
  }
}
