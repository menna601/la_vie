import 'package:flutter/foundation.dart';
import 'package:la_vie/utils/Api.dart';

import '../utils/shared_pref.dart';

class AppUser with ChangeNotifier {
  AppUser({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.imageUrl = '',
    this.accessToken = '',
    this.address,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final String accessToken;
  String? address;

  static AppUser _user = AppUser();
  AppUser get user => _user;

  bool isLogged() {
    return _user.firstName == '' ? false : true;
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        id: json['data']['user']['userId'],
        firstName: json['data']['user']['firstName'],
        lastName: json['data']['user']['lastName'],
        email: json['data']['user']['email'],
        imageUrl: json['data']['user']['imageUrl'],
        address: json['data']['user']['address'],
        accessToken: json['data']['accessToken']);
  }

  Future signIn(String email, String password, bool isRemember) async {
    final result = await Api.signIn(email, password);
    if (result != null) {
      _user = AppUser.fromJson(result);
      if (isRemember) _saveInShared(_user);
      notifyListeners();
    }
  }

  void _saveInShared(AppUser appUser) {
    PreferenceUtils.setString(SharedKeys.firstName, appUser.firstName);
    print(PreferenceUtils.getString(SharedKeys.firstName, appUser.firstName));
    PreferenceUtils.setString(SharedKeys.lastName, appUser.lastName);
    PreferenceUtils.setString(SharedKeys.userId, appUser.id);
    PreferenceUtils.setString(SharedKeys.email, appUser.email);
    PreferenceUtils.setString(SharedKeys.imageUrl, appUser.imageUrl);
    PreferenceUtils.setString(SharedKeys.accessToken, appUser.accessToken);
    PreferenceUtils.setString(SharedKeys.address, appUser.address ?? '');
  }

  void signUp(Map<String, dynamic> userData) async {
    Api.signUp(userData);
  }

  Future<bool> signInWithGoogle() async {
    final result = await Api.signInWithGoogle();
    if (result != null) {
      notifyListeners();
      return true;
    }
    return false;
  }

  void addAddress(String address) async {
    await Api.addAddress(address, accessToken);
    _user.address = address;
    notifyListeners();
  }

  void notifyListener() {
    notifyListeners();
  }
}
