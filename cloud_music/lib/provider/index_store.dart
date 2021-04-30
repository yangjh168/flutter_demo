import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexStore extends ChangeNotifier {
  ///根据BuildContext获取 [IndexStore]
  static IndexStore of(BuildContext context, {bool listen = true}) {
    return Provider.of<IndexStore>(context, listen: listen);
  }

  int currentIndex = 0;
  setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
