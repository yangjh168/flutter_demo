import 'package:flutter/material.dart';
import 'package:custom_tabbar/pages/home/keep_alive.dart';
import 'package:custom_tabbar/pages/home/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _controller;

  @override
  bool get wantKeepAlive => true;

  // 重新初始化
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    print('init home');
  }

  // 重新销毁
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          Tab(child: Text('推荐')),
          Tab(child: Text('最新')),
        ]),
      ),
      body: TabBarView(controller: _controller, children: <Widget>[
        KeepAliveDemo(),
        Text('222'),
      ]),
    );
  }
}
