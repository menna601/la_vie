import 'package:flutter/material.dart';
import 'package:la_vie/model/categories.dart';
import 'package:la_vie/routes/routes.dart';
import 'package:la_vie/web_platform/screens/products.dart';
import 'package:la_vie/web_platform/screens/sign_up_2.dart';
import 'package:provider/provider.dart';

import '../web_platform/screens/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case index:
        return MaterialPageRoute(builder: (_) => SignUp2());
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case search:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (_) => Categories(),
                  child: Products(),
                ));
    }
    return MaterialPageRoute(builder: (_) => Container());
  }
}
