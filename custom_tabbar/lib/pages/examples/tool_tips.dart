import 'package:flutter/material.dart';

class ToolTipsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('toast')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('请长按图片查看效果'),
            Tooltip(
                child: Image.network(
                    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2254797222,2003826743&fm=26&gp=0.jpg'),
                message: '不要碰我，我怕痒~'),
          ],
        ));
  }
}
