import 'package:flutter/material.dart';

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  String _draggableSrc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('拖拽效果')),
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text("请拖拽小图片放到大方框",
                    style: TextStyle(color: Colors.red, fontSize: 20.0)),
              )),
          DraggaleWidget(
              offset: Offset(0.0, 80.0),
              imgSrc:
                  'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1429998580,2238709221&fm=26&gp=0.jpg'),
          DraggaleWidget(
              offset: Offset(110.0, 80.0),
              imgSrc:
                  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3098125606,2097853389&fm=26&gp=0.jpg'),
          DraggaleWidget(
              offset: Offset(220.0, 80.0),
              imgSrc:
                  'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2023456965,1135413027&fm=26&gp=0.jpg'),
          Center(
            // 拖拽接收器
            child: DragTarget(
              onAccept: (String imgSrc) {
                _draggableSrc = imgSrc;
              },
              builder: (context, candidateDate, rejectedData) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  child: _draggableSrc == null
                      ? null
                      : Image.network(_draggableSrc, fit: BoxFit.cover),
                  color: Colors.yellow,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DraggaleWidget extends StatefulWidget {
  final Offset offset;
  final String imgSrc;
  const DraggaleWidget({Key key, this.offset, this.imgSrc}) : super(key: key);

  @override
  _DraggaleWidgetState createState() => _DraggaleWidgetState();
}

class _DraggaleWidgetState extends State<DraggaleWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.imgSrc,
        child: Container(
          width: 100.0,
          height: 100.0,
          child: Image.network(widget.imgSrc),
        ),
        feedback: Container(
          //拖拽的样式
          width: 110.0,
          height: 110.0,
          child: Image.network(widget.imgSrc),
        ),
        //拖拽结束
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}
