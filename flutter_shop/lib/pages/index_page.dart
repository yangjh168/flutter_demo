import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/pages/index/cart_page.dart';
import 'package:flutter_shop/pages/index/category_page.dart';
import 'package:flutter_shop/pages/index/home_page.dart';
import 'package:flutter_shop/pages/index/member_page.dart';
import 'package:flutter_shop/provider/index_store.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: '分类'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: '我的'),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  // 方式二
  final pageController = PageController();

  int viewIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    IndexStore indexStore = Provider.of<IndexStore>(context);
    int currentIndex = indexStore.currentIndex;
    if (viewIndex != currentIndex) {
      pageController.jumpToPage(currentIndex);
      setState(() {
        viewIndex = currentIndex;
      });
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: currentIndex,
        onTap: (index) {
          // setState(() {
          //   currentIndex = index;
          // });
          // 更新状态管理器里的数据(不需要监听的listen必须要写false, 否则会报错)
          // IndexStore indexStore = Provider.of<IndexStore>(context, listen: false);
          if (currentIndex != index) {
            indexStore.setCurrentIndex(index);
          }
        },
      ),
      // body: IndexedStack(
      //   index: currentIndex,
      //   children: tabBodies,
      // ),
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: tabBodies,
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
    );
  }
}
