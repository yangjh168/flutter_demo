import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/category_store.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/routers.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) {
      return CateGoryStore();
    })
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //创建路由对象
    final router = FluroRouter();
    //配置路由集Routes的路由对象
    Routes.configureRoutes(router);
    //给Routes 的router赋值
    Routes.router = router;

    return ScreenUtilInit(
      designSize: Size(750, 1334), //设计稿中设备的尺寸(单位随意,但在使用过程中必须保持一致)
      allowFontScaling: false, //设置字体大小是否根据系统的“字体大小”辅助选项来进行缩放
      builder: () => MaterialApp(
        title: '移动商城',
        debugShowCheckedModeBanner: false,
        //生成路由的回调函数，当导航的命名路由的时候，会使用这个来生成界面
        onGenerateRoute: Routes.router.generator,
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}
