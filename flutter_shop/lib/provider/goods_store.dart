import 'package:flutter/material.dart';
// import 'package:flutter_shop/entity/category.dart';

class GoodsStore extends ChangeNotifier {
  List categoryList = [];

  setChildCategory(List list) {
    categoryList = list;
    notifyListeners();
  }
}
