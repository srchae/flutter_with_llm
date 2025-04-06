import 'package:flutter/material.dart';
import 'package:flutter_begin/widgets/ai_message.dart';
import 'package:flutter_begin/widgets/human_message.dart';
import 'package:flutter_begin/widgets/input_message.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatController = TextEditingController();
  final gemini = Gemini.instance;
  List<Content> chatList = [];

  void handleNewChat(String newChat) async {
    setState(() {
      chatList = [
        ...chatList,
        Content(
          role: 'user',
          parts: [Part.text(newChat)],
        )
      ];
    });
    chatController.clear();
    final aiResponse = await gemini.chat(chatList);
    // debugPrint('aiResponse : ${aiResponse?.output}');
    setState(() {
      chatList = [
        ...chatList,
        Content(
          role: 'assistant',
          parts: [Part.text(aiResponse?.output ?? '')],
        )
      ];
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final part = chatList[index].parts?.first;
                final messageText = part is TextPart ? part.text : '';

                return chatList[index].role == 'assistant'
                    ? AiMessage(message: messageText)
                    : HumanMessage(message: messageText);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemCount: chatList.length,
            )),
            Row(
              children: [
                InputMessage(
                  onSubmit: handleNewChat,
                  controller: chatController,
                ),
                SizedBox(width: 16),
                IconButton(
                    onPressed: () {
                      handleNewChat(chatController.text);
                    },
                    icon: SvgPicture.asset('assets/icons/send-chat.svg'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
