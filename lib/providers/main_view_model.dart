import 'package:flutter/material.dart';

class MainViewProvider extends ChangeNotifier {
  late int selectedIndex;
  var pageViewController = PageController(initialPage: 0);

  MainViewProvider({this.selectedIndex = 0});

  void changeSelectedIndex(int newValue) {
    selectedIndex = newValue;
    notifyListeners();
  }
}
