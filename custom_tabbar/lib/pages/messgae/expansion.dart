import 'package:flutter/material.dart';

class ExpansionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ExpansionTile(
        title: Text('Expansion Tile'),
        leading: Icon(Icons.settings),
        backgroundColor: Colors.white12,
        initiallyExpanded: true, //是否默认打开
        children: [
          ListTile(
            title: Text('list tile'),
            subtitle: Text('subtitle'),
          )
        ],
      ),
    );
  }
}
