// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shop/dio/api.dart';
// import 'package:flutter_shop/entity/category.dart';
// import 'package:flutter_shop/mock/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/widget/LinkImage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/category_store.dart';
import 'package:flutter_shop/routers/routers.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text('分类'), elevation: 0),
      body: Container(
          child: Row(
        children: [LeftMenu(), _RightSubMenu()],
      )),
    );
  }
}

class LeftMenu extends StatefulWidget {
  @override
  _LeftMenuState createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
  int activeIndex = 0;
  List menuList = [];

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  void _getCategory() async {
    var categoryList = await getCateGoryList();
    // List<Category> list = categoryList.map((item) {
    //   var itemStr = json.decode(item.toString());
    //   Category categoryItem = Category.fromJson(itemStr);
    //   return categoryItem;
    // });
    // print(categoryList);
    setState(() {
      menuList.addAll(categoryList);
      // menuList.addAll(categoryList);
    });
    // 组件创建完成的回调通知方法,直接调用会报（setState() or markNeedsBuild() called during build）错；
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var childList = menuList[activeIndex]['productDetailss'];
      // 更新状态管理器里的数据(不需要监听的listen必须要写false, 否则会报错)
      CateGoryStore cateGoryStore =
          Provider.of<CateGoryStore>(context, listen: false);
      cateGoryStore.setChildCategory(childList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      // decoration: BoxDecoration(border: Border(right: BorderSide(width: 0.5, color: Colors.black12))),
      child: ListView.builder(
          itemCount: menuList.length,
          itemBuilder: (content, index) {
            return _leftItem(index);
          }),
    );
  }

  Widget _leftItem(int index) {
    bool isActive = (index == activeIndex) ? true : false;
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFFf5f5f5) : Colors.white,
          // border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              menuList[index]['name'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 26.sp,
                  color: isActive
                      ? Color(0xFFf63434)
                      : Color.fromRGBO(0, 0, 0, .6)),
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          activeIndex = index;
        });
        var childList = menuList[index]['productDetailss'];
        // 更新状态管理器里的数据(不需要监听的listen必须要写false, 否则会报错)
        CateGoryStore cateGoryStore =
            Provider.of<CateGoryStore>(context, listen: false);
        cateGoryStore.setChildCategory(childList);
      },
    );
  }
}

class _RightSubMenu extends StatefulWidget {
  @override
  __RightSubMenuState createState() => __RightSubMenuState();
}

class __RightSubMenuState extends State<_RightSubMenu> {
  @override
  Widget build(BuildContext context) {
    CateGoryStore cateGoryStore = Provider.of<CateGoryStore>(context);
    List subMenuList = cateGoryStore.categoryList;
    return Expanded(
      child: Container(
          color: Color(0xFFf5f5f5),
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(child: _subItemContent(subMenuList))),
    );
  }

  List<Widget> _itemList(List list) {
    return list.map((item) {
      return Container(
        width: 269.w,
        margin: EdgeInsets.only(right: 10.0.w, bottom: 10.0.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Colors.white),
        child: InkWell(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 250.0.w,
                  child: LinkImage(url: item['url']),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
                  height: 65.h,
                  child: Text(item['title'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center),
                ),
                Text(
                  '￥${item["price"] == 99999 ? item["marketPrice"] : item["price"]}',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
          onTap: () {
            Routes.navigateTo(context, '/goodsDetailPage',
                params: {"skuId": item['skuId']}).then((result) {
              // if (result != null) {
              //   print(result);
              // }
            });
          },
        ),
      );
    }).toList();
  }

  Widget _subItemContent(List subList) {
    if (subList != null && subList.length > 0) {
      return Container(
        padding: EdgeInsets.only(left: 10.0.w),
        margin: EdgeInsets.only(top: 10.0.w),
        child: Wrap(
          spacing: 0,
          children: _itemList(subList),
        ),
      );
    } else {
      return Text('暂无数据');
    }
  }
}
