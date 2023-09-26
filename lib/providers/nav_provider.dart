// tab_provider.dart

import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  int _pageIndex = 0;
  int _selectedTabIndex = 0;
  bool _bottomNavBarVisible = true;

  int get pageIndex => _pageIndex;
  int get selectedTabIndex => _selectedTabIndex;
  bool get bottomNavBarVisible => _bottomNavBarVisible;

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  setTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  setNavVisibility(index) {
    if (index == 1 && index > 0) {
      _bottomNavBarVisible = false;
    } else {
      _bottomNavBarVisible = true;
    }
    notifyListeners();
  }
}
