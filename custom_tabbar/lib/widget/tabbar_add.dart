import 'package:flutter/material.dart';
import 'package:custom_tabbar/pages/home.dart';
import 'package:custom_tabbar/pages/message.dart';
import 'package:custom_tabbar/pages/personal.dart';
// import 'package:custom_tabbar/pages/video.dart';
import 'package:custom_tabbar/pages/examples.dart';

class TabBarAdd extends StatefulWidget {
  @override
  _TabBarAddState createState() => _TabBarAddState();
}

class _TabBarAddState extends State<TabBarAdd> {
  final activeTabbarColor = Colors.blue;
  final unActiveTababarColor = Color(0xff646566);

  List<Widget> tabbarList = List();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    tabbarList..add(Home())..add(Examples())..add(Message())..add(Personal());
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width / 5;

    return Scaffold(
      body: tabbarList[currentIndex],
      floatingActionButton: FloatingActionButton(
          tooltip: "发布",
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
                width: itemWidth, child: bottomTabBarItem(0, '首页', Icons.home)),
            SizedBox(
                width: itemWidth,
                child: bottomTabBarItem(1, 'demo', Icons.airplay)),
            SizedBox(height: 49, width: itemWidth),
            SizedBox(
                width: itemWidth,
                child: bottomTabBarItem(2, '消息', Icons.email)),
            SizedBox(
                width: itemWidth,
                child: bottomTabBarItem(3, '我的', Icons.account_circle))
          ],
        ),
      ),
    );
  }

  Widget bottomTabBarItem(int index, String label, IconData icon) {
    Color color =
        currentIndex == index ? activeTabbarColor : unActiveTababarColor;
    //构造返回的Widget
    Widget item = Container(
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(icon, color: color),
                Text(label, style: TextStyle(color: color))
              ],
            ),
            onTap: () {
              if (currentIndex != index) {
                setState(() {
                  currentIndex = index;
                });
              }
            }));
    return item;
  }
}
