import 'package:flutter/material.dart';
import 'package:custom_tabbar/pages/home/keep_alive.dart';
import 'package:custom_tabbar/pages/home/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;

  // 重新初始化
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  // 重新销毁
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // print('点击搜索');
                showSearch(context: context, delegate: SearchBarDelegate());
              })
        ],
        bottom: TabBar(controller: _controller, tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ]),
      ),
      body: TabBarView(controller: _controller, children: <Widget>[
        KeepAliveDemo(),
        Text('222'),
        Text('333'),
      ]),
    );
  }
}
