// tab_provider.dart

import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  int _pageIndex = 0;
  int _selectedTabIndex = 0;

  int get pageIndex => _pageIndex;

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  int get selectedTabIndex => _selectedTabIndex;

  void setTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }
}
