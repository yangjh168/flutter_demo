import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

//创建Handler用来接收路由参数及返回第二个页面对象
Handler pageHandler({Widget page, Function builder}) {
  return Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('页面跳转参数' + params.toString());
      Map<String, Object> newParams;
      params.forEach((key, value) {
        if (value != null && value.length == 1) {
          newParams[key] = params[key].first;
        } else {
          newParams[key] = params[key];
        }
      });
      return builder(newParams);
    },
  );
}
