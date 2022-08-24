import 'package:flutter/material.dart';

import '../utils/Api.dart';
import '../utils/shared_pref.dart';

class Categories with ChangeNotifier {
  Categories(
      {this.plants = const [], this.seeds = const [], this.tools = const []});
  final List plants;
  final List seeds;
  final List tools;
  final List _general = [];

  static Categories _categories = Categories();
  Categories get categories => _categories;
  set general(List? list) {
    _categories._general!.addAll(list!);
    notifyListeners();
  }

  List get general => _general;

  factory Categories.fromJson(Map<String, dynamic> json) {
    print(json);
    return Categories(
      plants: json['plants'],
      seeds: json['seeds']!,
      tools: json['tools']!,
    );
  }

  void getCategories() async {
    final data = await Api.getCategories(
            PreferenceUtils.getString(SharedKeys.accessToken))
        as Map<String, dynamic>;
    _categories = Categories.fromJson(data);
    notifyListeners();
  }
}
