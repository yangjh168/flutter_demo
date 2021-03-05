// import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/dio/api.dart';
import 'package:flutter_shop/widget/space_header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_shop/mock/home.dart';
import 'package:flutter_shop/routers/routers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  int pageSize = 1;
  List hotGoodsList = [];
  Future
      _getTaskAsync; //使用变量存起方法getHomePageSwiper， 避免每次build的时候都去执行一次getHomePageSwiper()获取数据

  @override
  void initState() {
    super.initState();
    _getTaskAsync = getHomePageSwiper();
    _getHotGoodsList();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text('首页'), elevation: 0),
      body: FutureBuilder(
        future: _getTaskAsync,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // var data = snapshot.data;
            // print(data);
            // List<Map> swiper = (data['data']['carouselList'] as List).cast();
            return EasyRefresh(
              header: SpaceHeader(),
              footer: BallPulseFooter(),
              // footer: ClassicalFooter(
              //   enableHapticFeedback: false,
              //   bgColor: Colors.white,
              //   textColor: Colors.pink,
              //   infoColor: Colors.pink,
              //   loadText: '上拉加载',
              //   loadingText: '加载中...',
              //   loadReadyText: '释放加载',
              //   loadedText: '',
              //   loadFailedText: '加载失败',
              //   showInfo: false,
              //   noMoreText: '我也是有底线的',
              // ),
              child: ListView(
                children: [
                  SwiperDiy(swiperDataList: bannerList), //轮播图
                  HomeGridNav(
                    //导航菜单
                    gridList: gridList,
                  ),
                  ShareBanner(), //推荐图
                  Recommend(recommendList: recommendList), //推荐
                  hotGoods() //热门商品
                ],
              ),
              onRefresh: () async {
                setState(() {
                  _getTaskAsync = getHomePageSwiper();
                  page = 1;
                  hotGoodsList = [];
                  _getHotGoodsList();
                });
              },
              onLoad: () async {
                _getHotGoodsList();
              },
            );
          } else {
            return Center(
              child: Text('加载中'),
            );
          }
        },
      ),
    );
  }

  //获取火爆商品列表
  void _getHotGoodsList() async {
    var data = await getHotGoodsList(
        {'keyword': '手机', 'currentPage': page, 'pageSize': pageSize});
    setState(() {
      // hotGoodsList.addAll(hotList);
      if (data != null &&
          data.length > 0 &&
          data[0]['productDetailss'] != null &&
          data[0]['productDetailss'].length > 0) {
        hotGoodsList.addAll(data[0]['productDetailss']);
      }
      page++;
    });
  }

  //火爆专区头部
  Widget hotTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20.0.h),
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_fire_department_outlined,
              color: Theme.of(context).primaryColor),
          Text('火爆专区',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 26.0.sp,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  //火爆专区列表
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return Container(
          padding: EdgeInsets.all(10.0.w),
          child: InkWell(
            child: Container(
              width: 342.w,
              padding: EdgeInsets.all(10.0.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                  color: Colors.white),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: "${val['url']}",
                    placeholder: (context, url) => Container(
                      width: 130,
                      height: 80,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Text(val['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.pink, fontSize: 26.sp)),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: Row(
                      children: [
                        Text('¥${val['price']}'),
                        Text('¥${val['price']}',
                            style: TextStyle(
                                color: Colors.black26,
                                decoration: TextDecoration.lineThrough))
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              // 跳转到详情页
              Routes.navigateTo(context, Routes.goodsDetailPage,
                  params: {"skuId": val['skuId']}).then((result) {});
            },
          ),
        );
      }).toList();
      //返回流式布局
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('暂无数据');
    }
  }

  // 火爆专区
  Widget hotGoods() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Column(
        children: [hotTitle(), _wrapList()],
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
        mainAxisAlignment: MainAxisAlignment.center,
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
        child: Image.asset('assets/image/banner.png'),
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
  Widget _titleWidget(context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFf5f5f5)))),
      child: Row(
        children: [
          Icon(Icons.recommend, color: Theme.of(context).primaryColor),
          Text('商品推荐',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 26.0.sp,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  //商品列表每一项
  Widget _item(index, context) {
    return InkWell(
      child: Container(
        width: 230.w,
        padding: EdgeInsets.all(15.0.w),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Color(0xFFf5f5f5)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.0.w,
              height: 150.0.w,
              child: Image.network(recommendList[index]['image']),
            ),
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
      height: 250.w,
      //ListView的使用需要明确的一个高度
      child: ListView.builder(
          scrollDirection: Axis.horizontal, //横向
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _item(index, context);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0.h),
      child: Column(
        children: [_titleWidget(context), _recommedList()],
      ),
    );
  }
}
