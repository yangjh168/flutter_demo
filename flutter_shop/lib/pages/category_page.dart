// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter_shop/entity/category.dart';
import 'package:flutter_shop/mock/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/category_store.dart';

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
      appBar: AppBar(title: Text('分类'), backgroundColor: Color(0xFFf1503B)),
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
  List<Map> menuList = [];

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  void _getCategory() async {
    // var data = json.decode(categoryList.toString());
    // Category list = Category.fromJson(categoryList);
    setState(() {
      menuList.addAll(categoryList);
    });
    // 组件创建完成的回调通知方法,直接调用会报（setState() or markNeedsBuild() called during build）错；
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var childList = menuList[activeIndex]['children'];
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
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 0.5, color: Colors.black12))),
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
        // height: 100.h,
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        decoration: BoxDecoration(
            color: isActive ? Colors.white : Color(0xFFf5f5f5),
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(menuList[index]['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 26.sp))
          ],
        ),
      ),
      onTap: () {
        setState(() {
          activeIndex = index;
        });
        var childList = menuList[index]['children'];
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
    return Container(
        width: 570.w,
        color: Colors.white,
        padding: EdgeInsets.all(10.0.w),
        child: ListView.builder(
            itemCount: subMenuList.length,
            itemBuilder: (content, index) {
              return _subItemContent(subMenuList);
            }));
  }

  List<Widget> _itemList(List list) {
    return list.map((item) {
      return Container(
        width: 273.w,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [Image.network(item['icon']), Text(item['name'])],
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _subItemContent(List subList) {
    if (subList != null && subList.length > 0) {
      return Wrap(
        spacing: 2,
        children: _itemList(subList),
      );
    } else {
      return Text('暂无数据');
    }
  }
}
