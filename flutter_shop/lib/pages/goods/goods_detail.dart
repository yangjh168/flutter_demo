import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/dio/api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/widget/count_stepper.dart';

class GoodsDetail extends StatefulWidget {
  //参数
  final int skuId;

  const GoodsDetail({Key key, this.skuId}) : super(key: key);

  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  Map goodsInfo;
  int skuId;

  @override
  void initState() {
    super.initState();
    setState(() {
      skuId = widget.skuId;
    });
    _getGoodsInfo(skuId);
  }

  void _getGoodsInfo(int id) async {
    EasyLoading.show(status: '加载中');
    var data = await getGoodsDetail({
      'skuId': id
    }, {
      'headers': {'source_type': 504}
    });
    _setDefaultAttr(data);
    //设置
    setState(() {
      goodsInfo = data;
    });
    EasyLoading.dismiss();
  }

  //设置默认选中的属性
  void _setDefaultAttr(data) {
    List skuItem = data['attributes']['skuItems'];
    List configs = data['attributes']['configs'];
    var currentItem;
    skuItem.forEach((item) {
      if (item['skuId'] == skuId.toString()) {
        currentItem = item;
      }
    });
    print('当前配置：' + currentItem.toString());
    if (currentItem != null) {
      configs.forEach((item) {
        item['values'].asMap().keys.forEach((index) {
          var valItem = item['values'][index];
          if (currentItem[item['key']] == valItem['item']) {
            item['valueIndex'] = index;
          }
        });
        if (item['valueIndex'] == null) {
          item['valueIndex'] = 0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品详情"), elevation: 0),
      body: Stack(
        children: [
          EasyRefresh(
            header: MaterialHeader(),
            child: _renderBody(),
            onRefresh: () async {
              _getGoodsInfo(widget.skuId);
            },
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: _footerAction(),
          )
        ],
      ),
    );
  }

  //渲染主体内容
  Widget _renderBody() {
    if (goodsInfo != null) {
      return Column(
        children: <Widget>[
          _goodsSwiper(json.decode(goodsInfo['detailImages'])),
          _goodsSell(goodsInfo['listSellMaps']),
          _baseInfo(goodsInfo),
          GoodsAttributes(
              attributes: goodsInfo['attributes'], refreshFn: _getGoodsInfo),
          _servicesSku(goodsInfo['servicesSkuForm']['nameList']),
          GoodsServices(
              vipSerForm: goodsInfo['vipSerForm']['nameList'],
              baseSerList: goodsInfo['baseSerList']),
          _descImages(json.decode(goodsInfo['descriptionImages'])),
          Container(height: 100.0.h) //空白盒子避免底部操作按钮遮挡到内容；
        ],
      );
    } else {
      return Container();
    }
  }

  // 轮播图
  Widget _goodsSwiper(List swiperDataList) {
    return Container(
      height: 600.h,
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

  // 商品配置-----start
  Widget _goodsSell(List sellList) {
    return Container(
      height: 160.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, //横向
        itemCount: sellList.length,
        itemBuilder: (content, index) {
          return _sellItem(sellList[index]);
        },
      ),
    );
  }

  Widget _sellItem(Map item) {
    return Container(
      width: 187.5.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Image.network(item['icon']), width: 48.w, height: 48.w),
          Text('${item['title']}', overflow: TextOverflow.ellipsis),
          Text('${item['subTitle']}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Color(0xFF666666))),
        ],
      ),
    );
  }

  // 商品配置-----end
  // 基本信息
  Widget _baseInfo(Map goodsInfo) {
    return Container(
      margin: EdgeInsets.all(15.0.w),
      padding: EdgeInsets.all(15.0.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${goodsInfo['name']}', style: TextStyle(fontSize: 34.sp)),
          Html(data: '${goodsInfo['defaultSlogan']}'),
          Text('${goodsInfo['price']}',
              style: TextStyle(
                  fontSize: 34.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)),
          Text('${goodsInfo['creditsRateText']}',
              style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  // 保障服务
  Widget _servicesSku(List services) {
    return Container(
        margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.0.w),
        padding: EdgeInsets.all(20.0.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
            color: Colors.white),
        child: Row(
          children: [
            Container(
                child: Text('保障服务', style: TextStyle(color: Color(0xFF666666))),
                margin: EdgeInsets.only(right: 10.0)),
            Expanded(child: Text(services.join(' / '))),
          ],
        ));
  }

  // 商品图片详情
  Widget _descImages(List imagesList) {
    List<String> newList = [];
    imagesList.forEach((item) {
      if (item['image']['small_x2'] != '') {
        newList.add(item['image']['small_x2'] as String);
      }
    });
    return Container(
      child: Column(
        children: newList.map((item) {
          return CachedNetworkImage(
            imageUrl: "$item",
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
          );
          // return Text('${item['image']['small_x2']}');
        }).toList(),
      ),
    );
  }

  // 底部操作栏
  Widget _footerAction() {
    if (goodsInfo != null) {
      return Container(
        width: 750.w,
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 6.0.h),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(top: BorderSide(width: 0.5, color: Color(0xFFeeeeee)))),
        child: Row(
          children: [
            InkWell(
              child: Container(
                margin: EdgeInsets.only(right: 30.0.w),
                child: Column(
                  children: [
                    Icon(Icons.home, color: Color(0xFF666666)),
                    Text('首页', style: TextStyle(fontSize: 26.sp))
                  ],
                ),
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(right: 30.0.w),
                child: Column(
                  children: [
                    Icon(Icons.shopping_cart_rounded, color: Color(0xFF666666)),
                    Text('购物车', style: TextStyle(fontSize: 26.sp))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 20.0.w),
                child: FlatButton(
                  onPressed: () {},
                  child: Text('加入购物车', style: TextStyle(fontSize: 28.sp)),
                  color: Color(0xFFFF722C),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: FlatButton(
                onPressed: () {},
                child: Text('立即购买', style: TextStyle(fontSize: 28.sp)),
                color: Color(0xFFF63434),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )),
          ],
        ),
      );
    } else {
      return Text('');
    }
  }
}

// 属性信息
class GoodsAttributes extends StatefulWidget {
  final Map attributes;
  final dynamic refreshFn;

  GoodsAttributes({Key key, this.attributes, this.refreshFn}) : super(key: key);
  @override
  _GoodsAttributesState createState() => _GoodsAttributesState();
}

class _GoodsAttributesState extends State<GoodsAttributes> {
  List configs = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      configs = widget.attributes['configs'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.0.w),
      padding: EdgeInsets.all(20.0.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _attrList(),
      ),
    );
  }

  List<Widget> _attrList() {
    List<Widget> list = configs.asMap().keys.map((index) {
      // ignore: unnecessary_cast
      return _cellItem(index) as Widget;
    }).toList();
    list.add(_countStepper());
    return list;
  }

  Widget _cellItem(index) {
    List data = configs[index]['values'];
    int valueIndex = configs[index]['valueIndex'];
    var item = configs[index];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('${item['name']}',
                style: TextStyle(color: Color(0xFF666666))),
            margin: EdgeInsets.only(right: 20.0.w),
            padding: EdgeInsets.only(top: 10.0.h),
          ),
          Expanded(
            child: Container(
              child: _options(data, valueIndex: valueIndex, name: 'item',
                  change: (changeIndex, name) {
                //更新商品信息
                setState(() {
                  configs[index]['valueIndex'] = changeIndex;
                });
                _updateInfo();
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _options(List data,
      {int valueIndex = 0, String name = 'name', dynamic change}) {
    return Wrap(
      spacing: 10.0.w,
      runSpacing: 10.0.w,
      children: data.asMap().keys.map((index) {
        var currentItem = data[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          height: 50.0.h,
          // alignment: Alignment.center, //不能添加还参数，不然会导致Container换行
          decoration: BoxDecoration(
            border: Border.all(
                color: (index == valueIndex ? Colors.red : Colors.black12),
                width: 0.5,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: Text('${currentItem[name]}'),
                onTap: () {
                  change(index, currentItem[name]);
                },
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  //更新商品信息
  void _updateInfo() {
    var valObj = {};
    configs.forEach((item) {
      valObj[item['key']] = item['values'][item['valueIndex']];
    });
    print('选择的配置valObj' + valObj.toString());
    var current;
    widget.attributes['skuItems'].forEach((sku) {
      var num = 0;
      valObj.forEach((key, value) {
        if (sku[key] == value['item']) {
          num += 1;
        }
      });
      if (num == valObj.length) {
        current = sku;
      }
    });
    print('选择的配置skuItems：' + current.toString());
    if (current != null) {
      print('选择配置：' + current.toString());
      widget.refreshFn(int.parse(current['skuId']));
    }
  }

  // 数量选择
  Widget _countStepper() {
    return Container(
        height: 50.0.h,
        child: Row(
          children: [
            Container(
                child: Text('数量', style: TextStyle(color: Color(0xFF666666))),
                margin: EdgeInsets.only(right: 10.0)),
            CountStepper()
          ],
        ));
  }
}

class GoodsServices extends StatelessWidget {
  final List vipSerForm;
  final List baseSerList;
  GoodsServices({Key key, this.vipSerForm, this.baseSerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.0.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _vipSer(),
          _baseSer(),
        ],
      ),
    );
  }

  // 尊享服务
  Widget _vipSer() {
    return Container(
      padding: EdgeInsets.all(20.0.w),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5.w, color: Colors.black12))),
      child: Row(
        children: [
          Container(
              child: Text('尊享服务', style: TextStyle(color: Color(0xFF666666))),
              margin: EdgeInsets.only(right: 10.0)),
          Expanded(child: Text(vipSerForm.join(' / '))),
        ],
      ),
    );
  }

  // 基础服务
  Widget _baseSer() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Wrap(
        children: baseSerList.map((item) {
          return Container(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.check_circle_outline,
                    color: Color(0xFF666666), size: 28.0.sp),
                Text('$item', style: TextStyle(color: Color(0xFF666666))),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
