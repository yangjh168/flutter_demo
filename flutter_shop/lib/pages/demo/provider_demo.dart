import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/center.dart';

class ProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return MainProvide();
        })
      ],
      child: Column(
        children: <Widget>[Number(), MyButton()],
      ),
    ));
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainProvide provider = Provider.of<MainProvide>(context);
    int curNum = provider.curNum;
    return Container(
        margin: EdgeInsets.only(top: 200),
        child: Column(
          children: <Widget>[
            Text('$curNum'),
          ],
        ));
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainProvide provider = Provider.of<MainProvide>(context);
    return Container(
      child: RaisedButton(
        onPressed: () {
          provider.add();
        },
        child: Text('递增'),
      ),
    );
  }
}
