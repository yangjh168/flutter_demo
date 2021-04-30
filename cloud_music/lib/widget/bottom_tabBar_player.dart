// import 'dart:js';

// import 'package:cloud_music/music_player/widget/player.dart';
import 'package:cloud_music/provider/player_store.dart';
import 'package:cloud_music/routers/routers.dart';
import 'package:flutter/material.dart';

class AnimationPlayer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationPlayer();
}

class _AnimationPlayer extends State<AnimationPlayer>
    with SingleTickerProviderStateMixin {
  Duration duration;
  Duration position;
  double sliderValue;

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    this.initAnimation();
  }

  //初始化旋转动画
  void initAnimation() {
    _animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);
    // _animation = Tween(begin: .0, end: .5).animate(_animationController);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 _animationController.forward() 正向执行 结束时会回调此方法
        //重置起点
        // _animationController.reset();
        //开启
        // _animationController.forward();
        _animationController.repeat();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 _animationController.reverse() 反向执行 结束时会回调此方法
        _animationController.forward();
      } else if (status == AnimationStatus.forward) {
        //执行 _animationController.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 _animationController.reverse() 会回调此状态
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    PlayerStore player = PlayerStore.of(context);
    if (player.isPlaying) {
      //开始动画
      _animationController.forward();
    } else {
      _animationController.reset();
      _animationController.stop();
    }
    return InkWell(
      child: Stack(
        children: [
          RotationTransition(
            turns: _animation,
            child: new Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('images/icon_cd.jpg')),
              ),
            ),
          ),
          !player.isPlaying
              ? (Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(0, 0, 0, .4),
                    ),
                    child: Icon(Icons.play_arrow, color: Colors.white),
                  ),
                ))
              : Text(''),
        ],
      ),
      onTap: () {
        Routes.navigateTo(context, '/playerPage');
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
