import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/dio/api.dart';
import 'package:flutter_shop/routers/routers.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage>
    with AutomaticKeepAliveClientMixin {
  List menuList = [];

  @override
  void initState() {
    super.initState();
    _getMenuList();
  }

  void _getMenuList() async {
    var list = await getMemberMenuList({}, {
      'headers': {'source_type': '504'}
    });
    setState(() {
      menuList = list;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        elevation: 0, //默认是4， 0为没有阴影
      ),
      body: EasyRefresh(
        header: MaterialHeader(),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            ClipPath(
              clipper: HeadClipper(),
              child: Container(
                color: Color(0xFFf1503B),
                height: 340.0.h,
              ),
            ),
            Container(
              child: Column(
                children: [
                  _userInfo(),
                  _headGrid(),
                  _orderCard(),
                  _menuCard(),
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

  // 用户信息
  Widget _userInfo() {
    return Container(
      padding: EdgeInsets.all(30.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 140.0.h,
              height: 140.0.h,
              child: CircleAvatar(
                backgroundColor: Color(0xFFf5f5f5),
                backgroundImage: NetworkImage(
                    'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3175028800,3020836987&fm=11&gp=0.jpg'),
              )),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('卡布奇诺专属',
                      style: TextStyle(color: Colors.white, fontSize: 34.0.sp)),
                  Text('该用户太懒，啥东西都没有留下~', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // head的统计
  Widget _headGrid() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0.w))),
      margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 30.0.w),
      child: GridView.count(
        childAspectRatio: 1.3, //宽高比
        shrinkWrap: true,
        crossAxisCount: 4,
        physics: NeverScrollableScrollPhysics(), //关闭滚动
        children: [
          _headGridItem(num: 23, name: '商品收藏'),
          _headGridItem(num: 6, name: '店铺关注'),
          _headGridItem(num: 0, name: '优惠券'),
          _headGridItem(num: 100, name: '浏览记录'),
        ],
      ),
    );
  }

  Widget _headGridItem({num, name}) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$num',
              style: TextStyle(fontSize: 34.0.sp, fontWeight: FontWeight.bold)),
          Text('$name', style: TextStyle(fontSize: 24.0.sp)),
        ],
      ),
    );
  }

  //我的订单
  Widget _orderCard() {
    return Container(
        margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.0.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
            color: Colors.white),
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 20.0.w),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xFFf5f5f5)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('我的订单', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('全部订单', style: TextStyle(color: Colors.black38)),
                      Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.black38, size: 24.sp)
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 5,
                physics: NeverScrollableScrollPhysics(), //关闭滚动
                children: [
                  _orderItem(icon: Icons.account_balance_wallet, name: '待付款'),
                  _orderItem(icon: Icons.all_inbox, name: '待发货'),
                  _orderItem(icon: Icons.airport_shuttle, name: '已发货'),
                  _orderItem(icon: Icons.comment, name: '待评论'),
                  _orderItem(icon: Icons.cached_sharp, name: '退款/售后'),
                ],
              ),
            )
          ],
        ));
  }

  Widget _orderItem({icon, name}) {
    return InkWell(
      onTap: () {
        print('点击了菜单');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0.h),
            child: Icon(icon, color: Color(0XFF666666)),
          ),
          Text('$name',
              style: TextStyle(color: Color(0XFF666666), fontSize: 24.0.sp)),
        ],
      ),
    );
  }

  //其它功能
  Widget _menuCard() {
    if (menuList.length > 0) {
      return Column(
        children: menuList.map((item) {
          return Container(
              margin:
                  EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.0.w),
              child: Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0.h, horizontal: 20.0.w),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Color(0xFFf5f5f5)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item['name']}',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Container(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        physics: NeverScrollableScrollPhysics(), //关闭滚动
                        children: item['productDetailss'].map<Widget>((menu) {
                          return _menuItem(menu);
                        }).toList(),
                      ),
                    )
                    // child: Text(item['productDetailss'].toString()))
                  ],
                ),
              ));
        }).toList(),
      );
    } else {
      return Container();
    }
  }

  Widget _menuItem(Map item) {
    return InkWell(
      onTap: () {
        // 打开wenview页面
        Routes.navigateTo(context, '/webviewPage',
                params: {'url': item['link'], 'title': item['title']})
            .then((result) {});
        // print('点击了菜单');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 62.0.w,
            height: 62.0.w,
            margin: EdgeInsets.only(bottom: 10.0.h),
            child: Image.network(item['url']),
          ),
          Text('${item['title']}',
              style: TextStyle(color: Color(0XFF666666), fontSize: 24.0.sp)),
        ],
      ),
    );
  }
}

//贝塞尔曲线
class HeadClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 50);
    // 二次贝塞尔曲线
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
