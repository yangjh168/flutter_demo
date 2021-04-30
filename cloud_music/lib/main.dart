import 'package:cloud_music/pages/splash/page_splash.dart';
import 'package:cloud_music/pages/splash_page.dart';
import 'package:cloud_music/provider/player_store.dart';
import 'package:cloud_music/provider/settings.dart';
import 'package:cloud_music/provider/user_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:cloud_music/provider/cart_store.dart';
import 'package:provider/provider.dart';
import 'package:cloud_music/provider/category_store.dart';
import 'package:cloud_music/provider/index_store.dart';
import 'package:fluro/fluro.dart';
import 'package:cloud_music/routers/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_music/component/component.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  //https://www.jianshu.com/p/bc4a04794530
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PageSplash(
    futures: [
      //获取本地存储中的配置
      SharedPreferences.getInstance(),
      //获取用户数据
      UserAccount.getPersistenceUser(),
      //获取上次播放内容
      // getApplicationDocumentsDirectory().then((dir) {
      //   // getApplicationDocumentsDirectory获取应用文件目录类似于Ios的NSDocumentDirectory和Android上的 AppData目录
      //   Hive.init(dir.path);
      //   return Hive.openBox<Map>("player");
      // }),
    ],
    builder: (context, data) {
      print(data);
      return GlobalProvider(
        setting: Settings(data[0]),
        user: data[1],
        // player: data[2],
      );
    },
  ));
}

class GlobalProvider extends StatelessWidget {
  final Settings setting;

  final Map user;

  // final Box<Map> player;

  const GlobalProvider({
    Key key,
    @required this.setting,
    @required this.user,
    /*this.player*/
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) {
        return CateGoryStore();
      }),
      ChangeNotifierProvider(create: (context) {
        return IndexStore();
      }),
      ChangeNotifierProvider(create: (context) {
        return CartStore();
      }),
      ChangeNotifierProvider(create: (context) {
        return UserAccount(null);
      }),
      ChangeNotifierProvider(create: (context) {
        return PlayerStore();
      }),
    ], child: MyApp(setting: setting, user: user));
  }
}

class MyApp extends StatelessWidget {
  final Settings setting;

  final Map user;

  // final Box<Map> player;

  const MyApp({
    Key key,
    @required this.setting,
    @required this.user,
    /*this.player*/
  }) : super(key: key);
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
        title: '云音乐',
        debugShowCheckedModeBanner: false,
        //生成路由的回调函数，当导航的命名路由的时候，会使用这个来生成界面
        onGenerateRoute: Routes.router.generator,
        theme: setting.theme,
        // theme: ThemeData(
        //   // brightness: Brightness.dark, //黑色主题
        //   primaryColor: Color(0xFFf1503B),
        //   fontFamily: 'Montserrat',
        //   scaffoldBackgroundColor: Color(0xFFf5f5f5), //Scaffold底色
        //   // 文本主题
        //   textTheme: TextTheme(
        //     bodyText2: TextStyle(
        //         fontSize: 24.0.sp, color: Colors.black), //Material 的默认文本样式。
        //   ),
        // ),
        supportedLocales: [const Locale("en"), const Locale("zh")],
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          QuietLocalizationsDelegate(),
        ],
        home: SplashPage(),
        builder: EasyLoading.init(), //初始化EasyLoading
      ),
    );
  }
}
