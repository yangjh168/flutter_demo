import 'package:cloud_music/routers/index.dart';
import 'package:cloud_music/routers/routers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RouterView extends StatefulWidget {
  final int keyIndex = 0;
  // final Map<String, WidgetBuilder> routers = {
  //   '/slideDrawer': (params) => SlideDrawer(),
  //   '/player': (params) => PlayerRouterView(),
  // };

  @override
  _RouterViewState createState() => _RouterViewState();
}

@override
void initState() {
  //创建路由对象
  final router = FluroRouter();
  //配置路由集Routes的路由对象
  // Routes.configureRoutes(router);
  // //定义一个路由路径与Handler,

  // routers.forEach((key, value) {
  //   router.define(key, handler: pageHandler(builder: value));
  // });
  //给Routes 的router赋值
  Routes.router = router;
}

class _RouterViewState extends State<RouterView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(initialRoute: '/', onGenerateRoute: _onGenerateRoute);
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    if (settings.name == Navigator.defaultRouteName) {
      return MaterialPageRoute(
          settings: settings,
          builder: (context) => Container(
                child: Text('默认'),
              ));
    }
    List settingsList = settings.name.split("/");
    String homepath = settingsList[0];
    Widget widget;
    if (routes[homepath] is Map) {
      var builder = (routes[homepath] as Map)[settingsList[1]];
      widget = builder();
    } else {
      var builder = routes[homepath] as Function;
      widget = builder();
    }
    return MaterialPageRoute(settings: settings, builder: (context) => widget);
    // assert(widget != null, "can not generate route for $settings");
    // return null;
  }
}
