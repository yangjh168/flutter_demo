//参考链接：https://my.oschina.net/u/4602373/blog/4465401

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/handlers.dart';

//封装一个Routes 类
class Routes {
  //定义Router 对象
  static FluroRouter router;

  //定义路由路径
  static String goodsDetailPage = "/goodsDetailPage";

  //全局路由配置
  static void configureRoutes(FluroRouter router) {
    //定义找不到路由的回调方法，与显示界面
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route not found!");
      return Scaffold(
        body: Center(
          child: Text("Page not found"),
        ),
      );
    });

    //这里可以依次添加多个跳转的路由页面

    //定义一个路由路径与Handler,
    router.define(goodsDetailPage, handler: goodsDetailHandler);
  }

  // 需要页面返回值的跳转
  static navigateToForResult<T>(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn}) async {
    //FocusScope.of(context).requestFocus(new FocusNode());
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是 navigateTo 传递的参数：$query');

    path = path + query;
    T _result = await router.navigateTo(context, path,
        clearStack: clearStack, transition: transition);
    return _result;
  }

  // 对参数进行 encode，解决参数中有特殊字符
  //不需要返回值的跳转
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn}) {
    //FocusScope.of(context).requestFocus(new FocusNode());
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        String valueStr = params[key].toString();
        var value = Uri.encodeComponent(valueStr);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('navigateTo的参数：$query');
    path = path + query;
    return router.navigateTo(context, path,
        clearStack: clearStack, transition: transition);
  }
}
