import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/dio/api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/widget/count_stepper.dart';

class GoodsDetail extends StatefulWidget {
  //参数
  final String skuId;

  const GoodsDetail({Key key, this.skuId}) : super(key: key);

  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  Map goodsInfo;
  String skuId;

  @override
  void initState() {
    super.initState();
    skuId = widget.skuId;
    _getGoodsInfo();
  }

  void _getGoodsInfo() async {
    var data = await getGoodsDetail({'skuId': skuId});
    setState(() {
      goodsInfo = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("商品详情"),
        ),
        body: SingleChildScrollView(
          child: _renderBody(),
        ));
  }

  Widget _renderBody() {
    if (goodsInfo != null) {
      return Column(
        children: <Widget>[
          GoodsSwiper(swiperDataList: json.decode(goodsInfo['detailImages'])),
          GoodsSell(sellList: goodsInfo['listSellMaps']),
          BaseInfo(goodsInfo: goodsInfo),
          GoodsAttributes(attributes: goodsInfo['attributes']),
          ServicesSku(services: goodsInfo['servicesSkuForm']['nameList']),
          GoodsServices(
              vipSerForm: goodsInfo['vipSerForm']['nameList'],
              baseSerList: goodsInfo['baseSerList']),
          DescImages(imagesList: json.decode(goodsInfo['descriptionImages']))
        ],
      );
    } else {
      return Center(child: Text('加载中...'));
    }
  }
}

// 轮播图
class GoodsSwiper extends StatelessWidget {
  final List swiperDataList;

  GoodsSwiper({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

// 商品配置
class GoodsSell extends StatelessWidget {
  final List sellList;

  GoodsSell({Key key, this.sellList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: sellList.map((item) {
          return _sellItem(item);
        }).toList(),
      ),
    );
  }

  Widget _sellItem(Map item) {
    return Expanded(
        child: Column(children: [
      Container(child: Image.network(item['icon']), width: 48.w, height: 48.w),
      Text('${item['title']}'),
      Text('${item['subTitle']}', style: TextStyle(color: Color(0xFF666666))),
    ]));
  }
}

// 基本信息
class BaseInfo extends StatelessWidget {
  final Map goodsInfo;

  BaseInfo({Key key, this.goodsInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0.w),
      padding: EdgeInsets.all(15.0.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${goodsInfo['name']}', style: TextStyle(fontSize: 36.sp)),
          Html(data: '${goodsInfo['defaultSlogan']}'),
          Text('${goodsInfo['price']}',
              style: TextStyle(
                  fontSize: 36.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)),
          Text('${goodsInfo['creditsRateText']}',
              style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}

// 属性信息
class GoodsAttributes extends StatefulWidget {
  final Map attributes;

  GoodsAttributes({Key key, this.attributes}) : super(key: key);
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
        children: [
          Container(
              child: Text('${item['name']}',
                  style: TextStyle(color: Color(0xFF666666))),
              margin: EdgeInsets.only(right: 10.0)),
          _options(data, index: valueIndex, name: 'item',
              change: (changeIndex, name) {
            //更新商品信息
            _updateInfo();
            setState(() {
              // colorIndex = index;
              configs[index]['valueIndex'] = changeIndex;
            });
          })
        ],
      ),
    );
  }

  Widget _options(List data,
      {int index = 0, String name = 'name', dynamic change}) {
    return Wrap(
      children: data.asMap().keys.map((currentIndex) {
        var currentItem = data[currentIndex];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          height: 60.0.h,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10.0.w),
          decoration: BoxDecoration(
            border: Border.all(
                color: (currentIndex == index ? Colors.red : Colors.black12),
                width: 1.0,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: InkWell(
            child: Text('${currentItem[name]}'),
            onTap: () {
              change(currentIndex, currentItem[name]);
            },
          ),
        );
      }).toList(),
    );
  }

  //更新商品信息
  void _updateInfo() {
    // var valObj = {};
    // configs.forEach((item) {
    //   valObj[item.key] = item['values'][item['valueIndex']];
    // });
    // var current;
    // widget.attributes['skuItems'].forEach((sku) {
    //   var num = 0;
    //   configs.forEach((key) {
    //     var configsValue = configs[key];
    //     if (sku[key] == configsValue) {
    //       num += 1;
    //     }
    //   });
    //   if (num == configs.length) {
    //     current = sku;
    //   }
    // });
    // if (current != null) {
    //   print(current);
    // }
  }

  Widget _countStepper() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
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

// // 属性选择
// class CellItem extends StatefulWidget {
//   final Map item;
//   final int index;
//   final List configs;
//   final List skuItems;
//   CellItem({Key key, this.item, this.index, this.configs, this.skuItems}) : super(key: key);
//   @override
//   _CellItemState createState() => _CellItemState();
// }

// class _CellItemState extends State<CellItem> {
//   int colorIndex = 0;

//   void _updateInfo () {
//     var name = widget.configs[widget.index][colorIndex]['item'];

//     List newList = widget.skuItems.where((sku) {
//       return sku[widget.item['key']] == name &&  ;
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10.0.h),
//       child: Row(
//         children: [
//           Container(
//               child: Text('${widget.item['name']}',
//                   style: TextStyle(color: Color(0xFF666666))),
//               margin: EdgeInsets.only(right: 10.0)),
//           _options(widget.item['values'], index: colorIndex, name: 'item',
//               change: (index, name) {
//             //更新商品信息
//             _updateInfo();
//             setState(() {
//               colorIndex = index;
//             });
//           })
//         ],
//       ),
//     );
//   }

//   Widget _options(List data,
//       {int index = 0, String name = 'name', dynamic change}) {
//     return Wrap(
//       children: data.asMap().keys.map((currentIndex) {
//         var currentItem = data[currentIndex];
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 15.0.w),
//           height: 60.0.h,
//           alignment: Alignment.center,
//           margin: EdgeInsets.only(right: 10.0.w),
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: (currentIndex == index ? Colors.red : Colors.black12),
//                 width: 1.0,
//                 style: BorderStyle.solid),
//             borderRadius: BorderRadius.all(Radius.circular(5.0)),
//           ),
//           child: InkWell(
//             child: Text('${currentItem[name]}'),
//             onTap: () {
//               change(currentIndex, currentItem[name]);
//             },
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// 保障服务
class ServicesSku extends StatelessWidget {
  final List services;
  ServicesSku({Key key, this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Text(services.join(' / ')),
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
          Text(vipSerForm.join(' / ')),
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

// 商品图片详情
class DescImages extends StatelessWidget {
  final List imagesList;
  DescImages({Key key, this.imagesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> newList = [];
    imagesList.forEach((item) {
      if (item['image']['small_x2'] != '') {
        newList.add(item['image']['small_x2'] as String);
      }
    });
    return Container(
      child: Column(
        children: newList.map((item) {
          return Image.network('$item');
          // return Text('${item['image']['small_x2']}');
        }).toList(),
      ),
    );
  }
}
