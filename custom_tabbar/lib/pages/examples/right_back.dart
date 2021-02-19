import 'package:flutter/cupertino.dart';

class RightBack extends StatelessWidget {
  final bool isFirt;

  RightBack({Key key, this.isFirt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFirt == true ? '点我打开新页面' : '<<<尝试右滑返回',
              style:
                  TextStyle(fontSize: 16.0, color: CupertinoColors.activeGreen),
            ),
            CupertinoButton(
              child: Container(
                decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    border: Border.all(
                        color: CupertinoColors.activeBlue,
                        style: BorderStyle.solid,
                        width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Icon(CupertinoIcons.add,
                    size: 56, color: CupertinoColors.white),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (BuildContext context) {
                  return RightBack(isFirt: false);
                }));
              },
            ),
          ],
        ),
      ),
    ));
  }
}
