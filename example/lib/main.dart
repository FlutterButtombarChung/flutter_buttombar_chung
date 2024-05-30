import 'package:flutter/material.dart';
import 'package:flutter_buttombar_chung/flutter_buttombar_chung.dart';
import 'package:flutter_buttombar_chung/flutter_buttombar_chung_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ButtomBarChung Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(initialIndex: 1,), 
    );
  }
}

class MainPage extends StatefulWidget {
  final int initialIndex;

  MainPage({required this.initialIndex});
  
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: FlutterButtomBarChung(
        backgroundColor: Color(0xFF7EC4CF),
        items: <FlutterButtombarChungItem>[
          FlutterButtombarChungItem(child: Icon(Icons.psychology_rounded), title: ''),
          FlutterButtombarChungItem(child: Icon(Icons.home), title: ''),
          FlutterButtombarChungItem(child: Icon(Icons.wechat), title: ''),
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