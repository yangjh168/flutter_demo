import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Container(
      child: Text('首页'),
    );
  }

  void getHttp() async {
    try {
      Response response;
      response = await Dio().get(
        "http://47.106.112.113:8080/forumTopic/homeList?listType=3&page=1&rows=20",
      );
      return print(response);
    } catch (e) {
      return print(e);
    }
  }
}
