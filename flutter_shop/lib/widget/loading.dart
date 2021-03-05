import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 用法
// Loading.show(context, text);
// Loading.hide(context, text);
class Loading extends StatelessWidget {
  static String text = '加载中';

  Loading(String text);

  static void show(BuildContext context, String text) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => Theme(
        data: Theme.of(ctx).copyWith(dialogBackgroundColor: Colors.transparent),
        child: Loading(text),
      ),
    );
  }

  static void hide(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置透明背影
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: 120.0,
          height: 120.0,
          child: Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation(Color(0xffAA1F52))),
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: new Text(text,
                      style:
                          TextStyle(fontSize: 24.0.sp, color: Colors.black54)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
