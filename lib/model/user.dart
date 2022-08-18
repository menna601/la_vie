import 'package:flutter/foundation.dart';
import 'package:la_vie/utils/Api.dart';

class AppUser with ChangeNotifier {
  AppUser(
      {this.id = '',
      this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.imageUrl = '',
      this.address});

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final String? address;

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        id: json['data']['user']['userId'],
        firstName: json['data']['user']['firstName'],
        lastName: json['data']['user']['lastName'],
        email: json['data']['user']['email'],
        imageUrl: json['data']['user']['imageUrl'],
        address: json['data']['user']['address']);
  }

  Future<bool> signIn(String email, String password) async {
    final result = await Api.signIn(email, password);
    if (result != null) {
      notifyListeners();
      return true;
    }
    return false;
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
}
