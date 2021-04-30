import 'package:flutter/material.dart';

class MainProvide extends ChangeNotifier {
  int curNum = 0;
  add() {
    curNum += 1;
    notifyListeners();
  }

  minus() {
    curNum -= 1;
    notifyListeners();
  }
}
