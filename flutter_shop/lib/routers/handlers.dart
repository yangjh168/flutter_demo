import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/pages/goods/goods_detail.dart';

//创建Handler用来接收路由参数及返回第二个页面对象
Handler goodsDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  if (params != null && params.length > 0) {
    if (params['skuId'] != null) {
      String key = params['skuId'].first;
      return GoodsDetail(skuId: key);
    } else {
      throw Exception('Handler参数为null');
    }
  } else {
    return GoodsDetail();
  }
});
