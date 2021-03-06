import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/category_store.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    // 自定义EasyLoading颜色
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..maskType = EasyLoadingMaskType.black
      ..backgroundColor =
          Colors.white //loading的背景色, 仅对[EasyLoadingStyle.custom]有效.
      ..indicatorColor = Theme.of(context)
          .primaryColor //指示器的颜色, 仅对[EasyLoadingStyle.custom]有效.
      ..textColor = Colors.black //文本的颜色, 仅对[EasyLoadingStyle.custom]有效.
      ..userInteractions = false; //当loading展示的时候，是否允许用户操作.

    return ScreenUtilInit(
      designSize: Size(750, 1334), //设计稿中设备的尺寸(单位随意,但在使用过程中必须保持一致)
      allowFontScaling: false, //设置字体大小是否根据系统的“字体大小”辅助选项来进行缩放
      builder: () => MaterialApp(
        title: '移动商城',
        debugShowCheckedModeBanner: false,
        //生成路由的回调函数，当导航的命名路由的时候，会使用这个来生成界面
        onGenerateRoute: Routes.router.generator,
        theme: ThemeData(
          // brightness: Brightness.dark, //黑色主题
          primaryColor: Color(0xFFf1503B),
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: Color(0xFFf5f5f5), //Scaffold底色
          // 文本主题
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 24.0.sp), //Material 的默认文本样式。
          ),
        ),
        home: IndexPage(),
        builder: EasyLoading.init(), //初始化EasyLoading
      ),
    );
  }
}
