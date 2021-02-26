// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shop/dio/api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_shop/dio/json.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text('首页'), backgroundColor: Color(0xFFf1503B)),
      body: FutureBuilder(
        future: getHomePageSwiper(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // var data = snapshot.data;
            // print(data);
            // List<Map> swiper = (data['data']['carouselList'] as List).cast();
            return SingleChildScrollView(
                child: Column(
              children: [
                SwiperDiy(swiperDataList: bannerList),
                HomeGridNav(
                  gridList: gridList,
                ),
                ShareBanner(),
                Recommend(recommendList: recommendList)
              ],
            ));
          } else {
            return Center(
              child: Text('加载中'),
            );
          }
        },
      ),
    );
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
          return Image.network('${swiperDataList[index]}', fit: BoxFit.fill);
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 导航菜单
class HomeGridNav extends StatelessWidget {
  final List gridList;

  const HomeGridNav({Key key, this.gridList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: [
          Image.network(item['nav'], width: 90.w, height: 90.w),
          Text(item['name'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 5,
          padding: EdgeInsets.all(5.0),
          physics: NeverScrollableScrollPhysics(), //关闭滚动
          children:
              gridList.map((item) => _gridViewItemUI(context, item)).toList(),
        ));
  }
}

// 分享图
class ShareBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        child: Image.asset('images/banner.png'),
        onTap: () {
          _launchURL();
        },
      ),
    );
  }

  // 依赖url_launcher
  _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// 推荐商品
class Recommend extends StatelessWidget {
  final List recommendList;

  const Recommend({Key key, this.recommendList}) : super(key: key);

  //推荐商品头部标题
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text('商品推荐', style: TextStyle(color: Colors.pink)),
    );
  }

  //商品列表每一项
  Widget _item(index) {
    return InkWell(
      child: Container(
        height: 330.h,
        width: 250.w,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          children: [
            Image.network(recommendList[index]['image']),
            Text("¥${recommendList[index]['mallPrice']}",
                style: TextStyle(color: Colors.red)),
            Text(
              "¥${recommendList[index]['price']}",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }

  // 推荐商品横向列表
  Widget _recommedList() {
    return Container(
      height: 330.h,
      //ListView的使用需要明确的一个高度
      child: ListView.builder(
          scrollDirection: Axis.horizontal, //横向
          itemCount: recommendList.length,
          itemBuilder: (content, index) {
            return _item(index);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [_titleWidget(), _recommedList()],
      ),
    );
  }
}

class HotGoods extends StatefulWidget {
  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
