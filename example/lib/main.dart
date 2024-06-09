import 'package:flutter/material.dart';
import 'package:flutter_buttombar_chung/flutter_buttombar_chung.dart';
import 'package:flutter_buttombar_chung/flutter_buttombar_chung_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ButtomBarChung Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(
        initialIndex: 1,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final int initialIndex;

  const MainPage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: FlutterButtomBarChung(
        backgroundColor: const Color(0xFF7EC4CF),
        items: <FlutterButtombarChungItem>[
          FlutterButtombarChungItem(
              child: const Icon(Icons.psychology_rounded), title: ''),
          FlutterButtombarChungItem(child: const Icon(Icons.home), title: ''),
          FlutterButtombarChungItem(child: const Icon(Icons.wechat), title: ''),
        ],
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
