import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/pages/goods/goods_detail.dart';
import 'package:flutter_shop/pages/webview/webview_page.dart';

//创建Handler用来接收路由参数及返回第二个页面对象
Handler goodsDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('页面跳转参数' + params.toString());
  if (params != null && params.length > 0) {
    if (params['skuId'] != null) {
      int key = int.parse(params['skuId'].first);
      return GoodsDetail(skuId: key);
    } else {
      throw Exception('Handler参数为null');
    }
  } else {
    return GoodsDetail();
  }
});

Handler webviewPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('页面跳转参数' + params.toString());
  if (params != null && params.length > 0) {
    if (params['url'] != null && params['title'] != null) {
      String key = params['url'].first.toString();
      String title = params['title'].first.toString();
      return WebViewPage(url: key, title: title);
    } else {
      throw Exception('Handler参数为null');
    }
  } else {
    return WebViewPage();
  }
});
