import 'package:flutter/material.dart';
import 'package:flutter_begin/widgets/chat_message.dart';

class AiMessage extends StatelessWidget {
  const AiMessage({
    super.key,
    required this.message,
  });

  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/ai.png'),
        SizedBox(width: 16),
        ChatMessage(
          content: message,
        )
      ],
    );
  }
}
