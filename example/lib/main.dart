import 'package:flutter_buttombar_chung/flutter_buttombar_chung.dart';
import 'package:flutter_buttombar_chung/flutter_buttombar_chung_item.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<FlutterButtomBarChung> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlutterButtomBarChung(
        key: _bottomNavigationKey,
        index: 0,
        items: [
          FlutterButtombarChungItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          FlutterButtombarChungItem(
            child: Icon(Icons.search),
            label: 'Search',
          ),
          FlutterButtombarChungItem(
            child: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          FlutterButtombarChungItem(
            child: Icon(Icons.newspaper),
            label: 'Feed',
          ),
          FlutterButtombarChungItem(
            child: Icon(Icons.perm_identity),
            label: 'Personal',
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              ElevatedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  final FlutterButtomBarChung? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}