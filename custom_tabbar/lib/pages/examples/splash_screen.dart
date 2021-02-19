import 'package:custom_tabbar/widget/tabbar_add.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    //初始化动画
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    //监听
    _animation.addStatusListener((status) {
      // AnimationStatus.completed:表示动画已经执行完毕
      if (status == AnimationStatus.completed) {
        // pushAndRemoveUntil:跳转页面，并销毁当前控件
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => TabBarAdd()),
            (route) => route == null);
      }
    });

    _controller.forward(); //播放动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'http://qqpublic.qpic.cn/qq_public/0/0-2237191117-0D22387A64B541B537E2AE898FD303D8/0?fmt=jpg&size=84&h=1600&w=900&ppv=1/0',
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
