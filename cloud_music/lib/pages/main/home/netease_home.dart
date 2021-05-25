import 'package:flutter/material.dart';
import 'package:cloud_music/pages/main/home/netease/banner_swiper.dart';
import 'package:cloud_music/pages/main/home/netease/head_grid.dart';
import 'package:cloud_music/pages/main/home/netease/new_music_list.dart';
import 'package:cloud_music/pages/main/home/netease/recommend_playlist.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeteaseHome extends StatefulWidget {
  @override
  _NeteaseHomeState createState() => _NeteaseHomeState();
}

class _NeteaseHomeState extends State<NeteaseHome>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
  Widget build(BuildContext context) {
    super.build(context);
    List<Map> bannerList = [
      {
        "url":
            "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00799-2326.jpg"
      }
    ];
    return EasyRefresh(
      header: MaterialHeader(),
      bottomBouncing: false, //底部回弹
      child: Stack(
        clipBehavior: Clip.none,
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
    );
  }
}
