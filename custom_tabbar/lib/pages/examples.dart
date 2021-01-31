import 'package:custom_tabbar/pages/examples/clipper_curve.dart';
import 'package:custom_tabbar/pages/examples/wrap.dart';
import 'package:flutter/material.dart';

class Examples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('例子')),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //每行显示个数
                mainAxisSpacing: 10.0, //主轴间距
                crossAxisSpacing: 10.0, //纵轴间距
                childAspectRatio: 1, //行高比
              ),
              children: [
                ExampleItem(name: '流式布局', widget: WrapDemo()),
                ExampleItem(name: '曲线绘制', widget: ClipperCurve()),
                ExampleItem(name: 'demo3', widget: WrapDemo()),
                ExampleItem(name: 'demo4', widget: WrapDemo()),
                Image.network(
                  'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1819216937,2118754409&fm=26&gp=0.jpg',
                ),
              ],
            )));
  }
}

class ExampleItem extends StatelessWidget {
  final Widget widget;
  final String name;

  ExampleItem({Key key, @required this.name, @required this.widget});

  @override
  Widget build(BuildContext context) {
    return Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.lightBlue,
        ),
        child: InkWell(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.adb, color: Colors.white),
              Text('$name', style: TextStyle(color: Colors.white)),
            ],
          )),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => widget));
          },
        ));
  }
}
