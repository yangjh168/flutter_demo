import 'package:flutter/material.dart';
import 'package:custom_tabbar/pages/messgae/expansionList.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('init Message');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
