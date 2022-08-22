import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/andriod_platform/sign_up_android.dart';
import 'package:la_vie/model/user.dart';
import 'package:la_vie/routes/route_generator.dart';
import 'package:la_vie/routes/routes.dart';
import 'package:la_vie/utils/shared_pref.dart';
import 'package:la_vie/web_platform/Component/upper_bar.dart';
import 'package:la_vie/web_platform/screens/home.dart';
import 'package:la_vie/web_platform/screens/sign_up_2.dart';
import 'package:provider/provider.dart';

import 'constansts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.init();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "XXX",
        appId: "XXX",
        messagingSenderId: "XXX",
        projectId: "XXX",
      ),
    );
  }

  runApp(const LaVie());
}

class LaVie extends StatelessWidget {
  const LaVie({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppUser()),
    ], child: Wrapper());
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppUser _user = Provider.of<AppUser>(context).user;
    final fName = PreferenceUtils.getString(SharedKeys.firstName);
    print(_user.address);
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown
      }),
      theme: ThemeData(
        fontFamily: kIsWeb ? 'Poppins' : null,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor: MaterialStateProperty.all<Color>(kGreen),
              textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
        ),
      ),
      builder: (_, child) {
        Widget widget;
        widget = kIsWeb
            ? Scaffold(
                body: Column(
                  children: [UpperBar(), Expanded(child: child!)],
                ),
              )
            : SignUpAndroid();
        return widget;
      },
      home: !_user.isLogged() && fName == '' ? SignUp2() : Home(),
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: navKey,
    );
  }
}
