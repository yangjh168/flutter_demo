import 'package:cloud_music/pages/main/home/banner_swiper.dart';
import 'package:cloud_music/pages/main/home/head_grid.dart';
import 'package:cloud_music/pages/main/home/new_music_list.dart';
import 'package:cloud_music/pages/main/home/recommend_playlist.dart';
import 'package:cloud_music/repository/global_repository.dart';
import 'package:cloud_music/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List menuList = [];

  @override
  void initState() {
    super.initState();
    _getMenuList();
  }

  void _getMenuList() async {
    // var list = await getHomeMenuList({}, {
    //   'headers': {'source_type': '504'}
    // });
    // setState(() {
    //   menuList = list;
    // });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Map> bannerList = [
      {
        "url":
            "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00799-2326.jpg"
      }
    ];
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 10.0,
        elevation: 0,
        backgroundColor: Color(0xFFf1503B),
        // iconTheme: IconThemeData(color: Colors.black),
        // textTheme: Theme.of(context).primaryTextTheme,
        // brightness: Theme.of(context).primaryColorBrightness,
        leading: Center(
          child: GestureDetector(
            child: Icon(
              Icons.dehaze,
            ),
            onTap: () {
              //打开侧边栏
              var _slideKey = globalData.getSlideKey();
              if (_slideKey != null) {
                _slideKey.currentState.openOrClose();
              }
            },
          ),
        ),
        leadingWidth: 50.0.w,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0.w)),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          constraints: BoxConstraints(maxHeight: 34),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              // print('点击搜索');
              Routes.navigateTo(context, '/searchPage');
            },
            child: TextField(
              style: TextStyle(fontSize: 26.0.sp),
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false, //禁用
                contentPadding: EdgeInsets.all(2),
                focusColor: Colors.black,
                border: InputBorder.none,
                hintText: '请输入',
                hintStyle: TextStyle(fontSize: 26.0.sp),
                prefixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.search, color: Colors.black45),
                ),
                prefixStyle: TextStyle(fontSize: 24.sp),
              ),
            ),
          ),
        ),
        actions: [Icon(Icons.add)],
      ),
      body: EasyRefresh(
        header: MaterialHeader(),
        bottomBouncing: false, //底部回弹
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              color: Color(0xFFf1503B),
              height: 150.0.h,
            ),
            Container(
              child: Column(
                children: [
                  BannerSwiper(bannerList: bannerList),
                  HeadGrid(),
                  RecommendPlaylist(),
                  NewMusicList(),
                ],
              ),
            ),
          ],
        ),
        onRefresh: () async {
          _getMenuList();
        },
      ),
    );
  }
}
