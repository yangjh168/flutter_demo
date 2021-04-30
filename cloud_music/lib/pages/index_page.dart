import 'package:cloud_music/widget/bottom_tabBar_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_music/pages/main/home_page.dart';
import 'package:cloud_music/pages/main/user_page.dart';
import 'package:cloud_music/provider/index_store.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final pageController = PageController();

  int viewIndex = 0;
  final activeTabbarColor = Colors.blue;
  final unActiveTababarColor = Color(0xff646566);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    IndexStore indexStore = Provider.of<IndexStore>(context);
    int currentIndex = indexStore.currentIndex;
    if (viewIndex != currentIndex) {
      setState(() {
        viewIndex = currentIndex;
      });
    }
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: bottomTabBarItem(0, '首页', Icons.music_video_outlined)),
            SizedBox(child: bottomTabBarPlayer()),
            Expanded(
                flex: 1,
                child: bottomTabBarItem(1, '我的', Icons.account_circle)),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        // onPageChanged: (int index) {
        //   setState(() {
        //     currentIndex = index;
        //   });
        // },
        children: [
          HomePage(),
          UserPage(),
        ],
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
    );
  }

  Widget bottomTabBarItem(int index, String label, IconData icon) {
    Color color = viewIndex == index ? activeTabbarColor : unActiveTababarColor;
    //构造返回的Widget
    Widget item = InkResponse(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, color: color),
              Text(label, style: TextStyle(color: color))
            ],
          ),
        ),
        onTap: () {
          IndexStore indexStore =
              Provider.of<IndexStore>(context, listen: false);
          if (viewIndex != index) {
            indexStore.setCurrentIndex(index);
            pageController.jumpToPage(index);
          }
        });
    return item;
  }

  Widget bottomTabBarPlayer() {
    return AnimationPlayer();
  }
}
