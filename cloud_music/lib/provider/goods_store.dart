import 'package:flutter/material.dart';
// import 'package:cloud_music/entity/category.dart';

class GoodsStore extends ChangeNotifier {
  List categoryList = [];

  setChildCategory(List list) {
    categoryList = list;
    notifyListeners();
  }
}
