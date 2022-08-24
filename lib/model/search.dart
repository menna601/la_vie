import 'package:flutter/material.dart';

class Search with ChangeNotifier {
  String _search = '';

  String get search => _search;

  void updateSearch(String keyword) {
    _search = keyword;
    notifyListeners();
  }
}
