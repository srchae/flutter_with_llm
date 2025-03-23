import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        iconSize: 100,
        color: Colors.green,
        disabledColor: Colors.green[100],
        icon: Icon(Icons.abc));
  }
}
