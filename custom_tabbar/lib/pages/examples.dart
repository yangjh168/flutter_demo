import 'package:custom_tabbar/pages/examples/clipper_curve.dart';
import 'package:custom_tabbar/pages/examples/draggable_deme.dart';
import 'package:custom_tabbar/pages/examples/right_back.dart';
import 'package:custom_tabbar/pages/examples/tool_tips.dart';
import 'package:custom_tabbar/pages/examples/wrap.dart';
import 'package:flutter/material.dart';

class Examples extends StatefulWidget {
  @override
  _ExamplesState createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print('init examples ');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                ExampleItem(name: '右滑返回', widget: RightBack(isFirt: true)),
                ExampleItem(name: 'toast提示', widget: ToolTipsDemo()),
                ExampleItem(name: '拖拽效果', widget: DraggableDemo()),
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
