import 'package:flutter/material.dart';
import 'package:flutter_begin/chat_page.dart';
import 'package:flutter_begin/widgets/appbar/appbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  Gemini.init(apiKey: dotenv.env['GEMINI_API_KEY'] ?? "");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: const ChatPage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              child:
                  Container(width: 100, height: 100, color: Colors.blue)), // 1
          Positioned(
              top: 20,
              left: 10,
              child: Container(width: 50, height: 50, color: Colors.red)), // 2
          SizedBox(
            height: 100,
          ),
          MyAppbar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
        ],
      ),
    ));
  }
}
