import 'package:flutter/material.dart';
import 'package:flutter_shop/dio/api.dart';

class GoodsDetail extends StatefulWidget {
  //参数
  final String skuId;

  const GoodsDetail({Key key, this.skuId}) : super(key: key);

  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  Map goodsInfo;

  @override
  void initState() {
    super.initState();
    _getGoodsInfo();
  }

  void _getGoodsInfo() async {
    var goodsInfo = await getGoodsDetail({'skuId': widget.skuId});
    setState(() {
      goodsInfo = goodsInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //显示传递参数值
            Text(
              '${widget.skuId ?? "所传参数为空"}',
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  //出栈带上参数 返回至第一个页面
                  Navigator.pop(context, '第二个页面返回参数(${widget.skuId ?? null})');
                },
                child: Text('点击返回'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
