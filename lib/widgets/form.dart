import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                controller: controller,
                // onChanged: TextField의 value가 변경되면 실행
                onChanged: (value) {
                  debugPrint('onChanged: ${controller.text}');
                  setState(() {});
                },
                // onSubmitted: enter를 누르면 실행 (TextFormField에는 없음)
                // onSubmitted: (value) {
                //   debugPrint('onSubmitted: ${controller.text}');
                //   setState(() {});
                // },
                validator: (value) {
                  debugPrint('value: $value');
                  if (value != null && value.isEmpty) {
                    return '값이 입력되지 않았습니다';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(style: BorderStyle.solid)),
                    hintText: '값을 입력해주세요',
                    hintStyle: TextStyle(color: Colors.black45)),
              ),
            ),
            TextButton(
                onPressed: () {
                  debugPrint('validate!!: ${formKey.currentState!.validate()}');
                  if (formKey.currentState!.validate()) {
                    debugPrint('검증이 완료되었습니다!!: ${controller.text}');
                  }
                },
                child: Text('try validate?')),
          ],
        ),
      ),
    );
  }
}
