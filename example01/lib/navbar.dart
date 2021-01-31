import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/message.dart';
import 'pages/personal.dart';
import 'pages/video.dart';

// 快捷键：stful
class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final activeNavbarColor = Colors.blue;
  final unActiveNavabarColor = Color(0xff646566);
  int currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list..add(Home())..add(Video())..add(Message())..add(Personal());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: activeNavbarColor,
        unselectedItemColor: unActiveNavabarColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplay),
            label: '视频',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '我的',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
