import 'package:flutter/material.dart';
import 'package:custom_tabbar/pages/personal/clipper.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人中心')),
      body: ClipperDemo(),
    );
  }
}
