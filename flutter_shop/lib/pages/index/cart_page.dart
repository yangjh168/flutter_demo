import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/dio/api.dart';
import 'package:flutter_shop/provider/cart_store.dart';
import 'package:flutter_shop/widget/empty.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with AutomaticKeepAliveClientMixin {
  bool _allSelected = true; //维护复选框状态

  @override
  void initState() {
    super.initState();
    _getGoodsInfo(3013);
  }

  void _getGoodsInfo(int id) async {
    var data = await getGoodsDetail({'skuId': id});
    CartStore cartStore = Provider.of<CartStore>(context, listen: false);
    cartStore.addGoodsToCart(data);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(title: Text('购物车'), elevation: 0),
      body: Stack(
        overflow: Overflow.visible,
        fit: StackFit.expand,
        children: [
          Container(
            child: EasyRefresh(
              header: MaterialHeader(),
              child: Container(
                margin: EdgeInsets.only(top: 20.0.h),
                child: _goodsList(),
              ),
              onRefresh: () async {
                _getGoodsInfo(3013);
              },
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: _footAction(),
          ),
        ],
      ),
    );
  }

  Widget _goodsList() {
    CartStore cartStore = Provider.of<CartStore>(context);
    List goodsList = cartStore.goosList;
    if (goodsList != null && goodsList.isNotEmpty) {
      return Column(
        children: goodsList.map((item) {
          return GoodsCard(cardItem: item);
        }).toList(),
      );
    } else {
      return EmptyContainer(
        image: Image.asset('assets/image/nodata.png'),
        title: '购物车为空',
      );
    }
  }

  //底部操作按钮
  Widget _footAction() {
    return Container(
      width: 750.w,
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 6.0.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(top: BorderSide(width: 0.5, color: Color(0xFFeeeeee)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: _allSelected,
                activeColor: Colors.red, //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _allSelected = value;
                  });
                },
              ),
              Text('全选'),
            ],
          ),
          Row(
            children: [
              Text('合计：'),
              Container(
                  margin: EdgeInsets.only(right: 20.0.w),
                  child: Text('￥10', style: TextStyle(color: Colors.red))),
              Container(
                margin: EdgeInsets.only(right: 20.0.w),
                child: FlatButton(
                  onPressed: () {},
                  child: Text('结算'),
                  color: Color(0xFFFF722C),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// 店铺商品
class GoodsCard extends StatefulWidget {
  final cardItem;

  const GoodsCard({Key key, this.cardItem}) : super(key: key);

  @override
  _GoodsCardState createState() => _GoodsCardState();
}

class _GoodsCardState extends State<GoodsCard> {
  bool _checkboxSelected = true; //维护复选框状态

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
        children: [
          Container(
            child: Row(
              children: [
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red, //选中时的颜色
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
                ),
                Text('蒙牛官方旗舰店')
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red, //选中时的颜色
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 180.w,
                          height: 180.w,
                          child: Image.network(widget.cardItem['url']),
                        ),
                        Expanded(
                            child: Container(
                          height: 180.w,
                          padding: EdgeInsets.symmetric(vertical: 10.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${widget.cardItem['name']}',
                                  style: TextStyle(fontSize: 30.sp)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('￥10',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 34.sp,
                                          fontWeight: FontWeight.bold)),
                                  Text('x1'),
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
