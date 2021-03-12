import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

//创建Handler用来接收路由参数及返回第二个页面对象
Handler pageHandler({Widget page, List keys, Function builder}) {
  return Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('页面跳转参数' + params.toString());
      var newParams = {};
      if (keys != null && keys.length > 0) {
        keys.forEach((item) {
          if (params != null && params.length > 0 && params[item] != null) {
            String paramsValue = params[item].first.toString();
            newParams[item] = paramsValue;
          } else {
            throw Exception('Handler参数为null');
          }
        });
      } else {
        return builder();
      }
      return builder(newParams);
    },
  );
}
