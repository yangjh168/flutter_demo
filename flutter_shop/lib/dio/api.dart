import 'package:dio/dio.dart';
// import 'dart:async';
// import 'dart:io';
import '../config/index.dart';

/// 获取首页轮播图数据
Future getHomePageSwiper() async {
  try {
    Response response;
    response = await Dio().get(
      serviceHost + "/sysParams/homeParamList",
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print(e);
  }
}
