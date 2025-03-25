import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: Border(bottom: BorderSide(color: Color(0xFF656565), width: 1)),
        title: Text(
          'Gemini',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, height: 22 / 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/ai.png'),
                SizedBox(width: 16),
                // Extract Widget
                ChatMessage(
                  isHuman: false,
                  message:
                      'Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!',
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChatMessage(
                    message:
                        'A fast 50mm like f1.8 would help with the bokeh. I’ve been using primes as they tend to get a bit sharper images.',
                    isHuman: true),
                SizedBox(width: 16),
                Image.asset('assets/images/human.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isHuman;
  const ChatMessage({super.key, required this.message, required this.isHuman});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.03),
            borderRadius: BorderRadius.only(
              topLeft: !isHuman ? Radius.zero : Radius.circular(6),
              topRight: !isHuman ? Radius.zero : Radius.circular(6),
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            )),
        child: Text(
          message,
          style: TextStyle(
            fontSize: 13,
            height: 18 / 13,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
