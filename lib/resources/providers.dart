import 'package:flutter/material.dart';

class PagesState with ChangeNotifier {
  int _page = 0;

  int get page => _page;

  changePage(int page) {
    _page = page;
    notifyListeners();
  }
}

class SeeAllType with ChangeNotifier {
  String _type = "popular";
  String get type => _type;

  bool _openSeeAll = false;
  bool get openSeeAll => _openSeeAll;

  changeType(String type) {
    _type = type;
    notifyListeners();
  }

  changeSeeAll() {
    _openSeeAll = !_openSeeAll;
    notifyListeners();
  }
}
