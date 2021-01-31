import 'package:flutter/material.dart';

class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;

  //重新开启缓存
  @override
  bool get wantKeepAlive => true;

  //计数器
  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('$_count')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'add',
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
        heroTag: "second",
      ),
    );
  }
}
