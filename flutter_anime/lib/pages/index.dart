// import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anime/mock/home.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:flutter_anime/dio/api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_anime/routers/routers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  int pageSize = 1;
  List hotGoodsList = [];
  // Future _getTaskAsync; //使用变量存起方法getHomePageSwiper， 避免每次build的时候都去执行一次getHomePageSwiper()获取数据

  @override
  void initState() {
    super.initState();
    // _getTaskAsync = getHomePageSwiper();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            automaticallyImplyLeading: false, //隐藏返回箭头
            elevation: 0,
            title: Text('小桦娱乐')),
        body: EasyRefresh(
          header: MaterialHeader(),
          // footer: BezierBounceFooter(),
          child: ListView(
            children: [
              HomeGridNav(
                title: '动漫导航',
                gridList: gridList,
              ),
              HomeGridNav(
                title: '资源共享',
                gridList: shareList,
              ),
              // InkWell(
              //   child: Text("测试"),
              //   onTap: () {
              //     // 打开wenview页面
              //     Routes.navigateTo(context, '/webViewExample', params: {})
              //         .then((result) {});
              //   },
              // )
            ],
          ),
          onRefresh: () async {
            setState(() {
              page = 1;
            });
          },
          // onLoad: () async {
          // },
        ));
  }
}

// 轮播图
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333.h,
      width: 750.w,
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network('${swiperDataList[index]['url']}',
              fit: BoxFit.fill);
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 导航菜单
class HomeGridNav extends StatelessWidget {
  final String title;
  final List gridList;

  const HomeGridNav({Key key, this.title, this.gridList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
            color: Colors.white),
        child: Column(
          children: [
            _cardTitle(),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              padding: EdgeInsets.all(5.0),
              physics: NeverScrollableScrollPhysics(), //关闭滚动
              children: gridList
                  .map((item) => _gridViewItemUI(context, item))
                  .toList(),
            )
          ],
        ));
  }

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        // 打开wenview页面
        Routes.navigateTo(context, '/webviewPage',
                params: {'url': item['url'], 'title': item['name']})
            .then((result) {});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(item['icon'], width: 90.w, height: 90.w),
          Text(item['name'])
        ],
      ),
    );
  }

  Widget _cardTitle() {
    return Container(
      padding: EdgeInsets.only(top: 20.0.w, left: 20.0.w, right: 20.0.w),
      child: Text('$title',
          style: TextStyle(
              fontSize: 28.0.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xff666666))),
    );
  }
}
