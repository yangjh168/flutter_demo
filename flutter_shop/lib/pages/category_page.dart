import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/category.dart';
import 'package:flutter_shop/mock/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: LeftMenu(),
      ),
    );
  }
}

class LeftMenu extends StatefulWidget {
  @override
  _LeftMenuState createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
          itemCount: menuList.length,
          itemBuilder: (content, index) {
            return _leftItem(index);
          }),
    );
  }

  Widget _leftItem(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100.h,
        padding: EdgeInsets.only(left: 10.0, top: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(menuList[index]['name'], style: TextStyle(fontSize: 26.sp)),
      ),
    );
  }
}
