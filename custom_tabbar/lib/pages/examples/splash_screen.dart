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
        vsync: this, duration: Duration(microseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    //监听
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
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
        'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1819216937,2118754409&fm=26&gp=0.jpg',
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
