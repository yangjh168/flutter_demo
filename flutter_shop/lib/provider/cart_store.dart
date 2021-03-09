import 'package:flutter/material.dart';

class CartStore extends ChangeNotifier {
  List goosList = [];

  addGoodsToCart(Map goods) {
    bool isHas = false;
    goosList.forEach((item) {
      if (item['id'] == goods['id']) {
        if (item['amount'] == null) {
          item['amount'] = 1;
        }
        item['amount'] += 1;
        isHas = true;
      }
    });
    if (!isHas) {
      goosList.add(goods);
    }
    notifyListeners();
  }

  //清空
  clear() {
    goosList.clear();
  }
}
