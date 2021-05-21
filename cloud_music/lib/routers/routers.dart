//参考链接：https://my.oschina.net/u/4602373/blog/4465401

import 'package:cloud_music/pages/layout/player_router_view.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:cloud_music/provider/index_store.dart';
import 'package:cloud_music/routers/handlers.dart';
import 'package:cloud_music/routers/index.dart';
import 'package:provider/provider.dart';

//封装一个Routes 类
class Routes {
  //定义Router 对象
  static FluroRouter router;

  //定义路由路径
  static String webviewPage = "/webviewPage";

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

    //定义一个路由路径与Handler,
    // routers.forEach((key, value) {
    //   router.define(key, handler: pageHandler(builder: value));
    // });
    routerConfig.forEach((item) {
      router.define(item['path'],
          handler: pageHandler(builder: item['component']));
    });
  }

  // 需要页面返回值的跳转
  static navigateToForResult<T>(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool clearStack = false,
      TransitionType transition = TransitionType.inFromRight}) async {
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
      TransitionType transition = TransitionType.inFromRight}) {
    //FocusScope.of(context).requestFocus(new FocusNode());
    var routerViewState = PlayerRouterView.of(context);
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
    var currentRouter = router;
    var pathArray = path.split("/");
    // print(pathArray);
    path = '/' + pathArray[1] + query;
    var routeSettings;
    //当打开的是二级路由，则默认把路径第二个值当作参数传给router-view作为初始路由
    if (pathArray.length > 2) {
      routeSettings = RouteSettings(
        arguments: pathArray[2] + query, //路由要带上参数，fluro会自动把它转为参数返回给handler
      );
      //当在router-view页面上进行路由跳转时，只认最后一个路由名字；
      if (routerViewState != null) {
        path = '/' + pathArray[pathArray.length - 1] + query;
        print("重置fluro");
        currentRouter = routerViewState.router;
      }
    }
    print("path：" + path);
    print(currentRouter.notFoundHandler);
    return currentRouter.navigateTo(
      context,
      path,
      clearStack: clearStack,
      transition: transition,
      routeSettings: routeSettings,
    );
  }

  //返回
  static void pop<T>(BuildContext context, [T result]) {
    return router.pop(context, result);
  }

  // 返回顶层
  static void switchPop<T>(BuildContext context, int index, [T result]) {
    IndexStore indexStore = Provider.of<IndexStore>(context, listen: false);
    indexStore.setCurrentIndex(index);
    return Navigator.of(context).popUntil(ModalRoute.withName('/'));
  }
}
