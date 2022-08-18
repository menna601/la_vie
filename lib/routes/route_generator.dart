import 'package:flutter/material.dart';
import 'package:la_vie/routes/routes.dart';
import 'package:la_vie/web_platform/screens/sign_up_2.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case index:
        return MaterialPageRoute(builder: (_) => SignUp2());
      case home:
        return MaterialPageRoute(builder: (_) => Container());
    }
    return MaterialPageRoute(builder: (_) => Container());
  }
}
