import 'package:flutter/material.dart';
// import 'package:custom_tabbar/pages/messgae/expansion.dart';
import 'package:custom_tabbar/pages/messgae/expansionList.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('消息')),
      // body: Column(
      //   children: [
      //     ExpansionDemo(),
      //     ExpansionList()
      //   ],
      // ));
      body: ExpansionList(),
    );
  }
}
