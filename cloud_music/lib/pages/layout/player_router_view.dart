import 'package:cloud_music/music_player/player_page.dart';
import 'package:cloud_music/pages/error_page.dart';
import 'package:cloud_music/routers/handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:cloud_music/widget/bottom_player_bar.dart';

class PlayerRouterView extends StatefulWidget {
  //当前路由层次的路径
  final String path;

  final List routes;

  PlayerRouterView({Key key, @required this.path, @required this.routes})
      : super(key: key);

  static _PlayerRouterViewState of(BuildContext context) {
    // findAncestorStateOfType()可以从当前节点沿着widget树向上查找指定类型的StatefulWidget对应的State对象。
    // 注意：context必须为LoadDataBuilder子节点的context
    return context.findAncestorStateOfType<_PlayerRouterViewState>();
  }

  @override
  _PlayerRouterViewState createState() => _PlayerRouterViewState();
}

class _PlayerRouterViewState extends State<PlayerRouterView> {
  FluroRouter router;

  @override
  void initState() {
    super.initState();
    var fluroRouter = FluroRouter();
    //创建路由对象
    //定义找不到路由的回调方法，与显示界面
    fluroRouter.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route not found!");
      return Scaffold(
        body: Center(
          child: Text("Page not found"),
        ),
      );
    });
    //添加默认路由
    fluroRouter.define('/', handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Scaffold(
          body: Center(
        child: Text("默认页面"),
      ));
    }));
    //配置路由集Routes的路由对象
    widget.routes.forEach((item) {
      fluroRouter.define(item['path'],
          handler: pageHandler(builder: item['component']));
    });
    this.setState(() {
      router = fluroRouter;
    });
    print("初始化router-view完成");
  }

  @override
  Widget build(BuildContext context) {
    print("build二级路由");
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              initialRoute: widget.path,
              onGenerateRoute: router.generator,
              onUnknownRoute: (RouteSettings setting) {
                String name = setting.name;
                print("未匹配到路由:$name");
                return MaterialPageRoute(builder: (context) {
                  return ErrorPage();
                });
              },
            ),
          ),
          BottomPlayerBar(),
          InkWell(
            onTap: () {
              router.navigateTo(context, '/test');
            },
            child: Text("似懂非懂多多多"),
          )
        ],
      ),
    );
  }

  // Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  //   print(settings);
  // }
}
// class _PlayerRouterViewState extends State<PlayerRouterView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Navigator(
//               // initialRoute: '/player',
//               onGenerateRoute: _onGenerateRoute,
//               onUnknownRoute: (val) {
//                 print(val);
//                 return null;
//               },
//             ),
//           ),
//           BottomPlayerBar()
//         ],
//       ),
//     );
//   }

//   Route<dynamic> _onGenerateRoute(RouteSettings settings) {
//     print('settings===============');
//     print(settings.name);
//     if (settings.name == Navigator.defaultRouteName) {
//       return MaterialPageRoute(
//           settings: settings,
//           builder: (context) => Container(
//                 child: Text('默认'),
//               ));
//     }
//     Widget widget;
//     switch (settings.name) {
//       case '/list':
//         widget = Container(
//           child: Text("list"),
//         );
//         break;
//       case '/search':
//         // return Container();
//         widget = Container(
//           child: Text("search"),
//         );
//         break;
//       case '/settings':
//         widget = Container(
//           child: Text("settings"),
//         );
//         break;
//       default:
//         widget = Container(
//           child: Text('其它'),
//         );
//         break;
//     }
//     return MaterialPageRoute(settings: settings, builder: (context) => widget);
//     // assert(widget != null, "can not generate route for $settings");
//     // return null;
//   }
// }
