import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/andriod_platform/sign_up_android.dart';
import 'package:la_vie/model/user.dart';
import 'package:la_vie/routes/route_generator.dart';
import 'package:la_vie/routes/routes.dart';
import 'package:la_vie/web_platform/Component/upper_bar.dart';
import 'package:provider/provider.dart';

import 'constansts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppUser()),
        ],
        child: MaterialApp(
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
              ),
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
          initialRoute: index,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: navKey,
          //home: kIsWeb ? SignUp2() : SignUpAndroid(),
        ));
  }
}
