// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shop/dio/api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  static const gridList = [
    {
      'name': '白酒',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
    {
      'name': '啤酒',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
    {
      'name': '葡萄酒',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
    {
      'name': '洋酒',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
    {
      'name': '保健酒',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
    {
      'name': '预调酒',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
    {
      'name': '下酒小菜',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
    {
      'name': '饮料',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
    {
      'name': '乳制品',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
    {
      'name': '休闲零食',
      'nav':
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // getHomePageSwiper();
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: FutureBuilder(
        future: getHomePageSwiper(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            List<Map> swiper = (data['data']['carouselList'] as List).cast();
            return Column(
              children: [
                SwiperDiy(swiperDataList: swiper),
                HomeGridNav(
                  gridList: gridList,
                )
              ],
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
}

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
          return Image.network(
              'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1819216937,2118754409&fm=26&gp=0.jpg', //Image.network('${swiperDataList[index]['paramKey']}',
              fit: BoxFit.fill);
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

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
      height: 320.h,
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children:
            gridList.map((item) => _gridViewItemUI(context, item)).toList(),
      ),
    );
  }
}
