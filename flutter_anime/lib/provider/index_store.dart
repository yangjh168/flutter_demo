import 'package:flutter/material.dart';

class IndexStore extends ChangeNotifier {
  int currentIndex = 0;

  setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
