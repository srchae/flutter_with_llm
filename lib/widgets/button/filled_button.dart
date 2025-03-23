import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: () {}, child: Text('FilledButton'));
  }
}
