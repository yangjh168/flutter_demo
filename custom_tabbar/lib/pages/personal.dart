import 'package:flutter/material.dart';
import 'package:custom_tabbar/pages/personal/clipper.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('init Personal');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        elevation: 0, //默认是4， 设置成0 就是没有阴影了
      ),
      body: ClipperDemo(),
    );
  }
}
