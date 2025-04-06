import 'package:flutter/material.dart';
import 'package:flutter_begin/widgets/chat_message.dart';

class HumanMessage extends StatelessWidget {
  const HumanMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatMessage(
          content: message,
        ),
        SizedBox(width: 16),
        Image.asset('assets/images/human.png'),
      ],
    );
  }
}
