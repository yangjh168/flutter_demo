import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/index.dart';
import 'routes/index.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flukit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flukit demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListPage([
        //PageInfo("test", (ctx) => TestRoute()),
        PageInfo("Quick Scrollbar", (ctx) => QuickScrollbarRoute()),
        PageInfo("TurnBox", (ctx) => TurnBoxRoute()),
        PageInfo("AnimatedRotationBox", (ctx) => AnimatedRotationBoxRoute()),
        PageInfo("Pull Refresh", (ctx) => PullRefreshBoxRoute()),
        PageInfo("Swiper", (ctx) => SwiperRoute()),
        PageInfo("Swiper Style", (ctx) => SwiperStyleRoute()),
        PageInfo("Photo View", (ctx) => PhotoViewRoute()),
        PageInfo("InfiniteListView", (ctx) => InfiniteListViewRoute()),
        PageInfo("(Raised)GradientButton", (ctx) => GradientButtonRoute()),
        PageInfo("GradientCircularProgressIndicator",
            (ctx) => GradientCircularProgressRoute()),
        PageInfo(
            "NineGridView & DragSortView", (ctx) => NineGridRoute(), false),
        PageInfo("AzListView", (ctx) => QuickSelectListViewRoute()),
      ]),
    );
  }
}
