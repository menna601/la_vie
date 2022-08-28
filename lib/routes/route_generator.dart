import 'package:flutter/material.dart';
import 'package:la_vie/model/categories.dart';
import 'package:la_vie/routes/routes.dart';
import 'package:la_vie/web_platform/dialog/reset_password.dart';
import 'package:la_vie/web_platform/dialog/send_otp.dart';
import 'package:la_vie/web_platform/dialog/verify_otp.dart';
import 'package:la_vie/web_platform/screens/products.dart';
import 'package:la_vie/web_platform/screens/sign_up_2.dart';
import 'package:provider/provider.dart';

import '../model/search.dart';
import '../web_platform/screens/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case index:
        return MaterialPageRoute(builder: (_) => SignUp2());
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case shop:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (_) => Categories()),
                    ChangeNotifierProvider(create: (_) => Search())
                  ],
                  child: Products(),
                ));
      case blogs:
        return MaterialPageRoute(builder: (_) => BlogsList());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => SendOTP());
      case verifyOTP:
        return MaterialPageRoute(builder: (_) => VerifyOTP(args: args));
      case resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPassword(args: args));
    }
    return MaterialPageRoute(builder: (_) => Container());
  }
}
