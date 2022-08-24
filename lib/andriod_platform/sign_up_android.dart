import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../constansts.dart';
import '../web_platform/screens/sign_up_2.dart';
import '../web_platform/screens/two_tab_container.dart';

class SignUpAndroid extends StatefulWidget {
  @override
  State<SignUpAndroid> createState() => _SignUpAndroidState();
}

class _SignUpAndroidState extends State<SignUpAndroid> {
  TabStatus selectedTap = TabStatus.leftTab;
  void changeTab(TabStatus tabStatus) {
    setState(() {
      selectedTap = tabStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned(
              right: 0, top: 0, child: SvgPicture.asset('svg/green_leaf.svg')),
          Positioned(
              bottom: -55,
              left: 0,
              child: Transform.rotate(
                angle: 180 * math.pi / 180,
                child: SvgPicture.asset('svg/green_leaf.svg'),
              )),
          Padding(
            padding: EdgeInsets.only(top: 150, left: 42, right: 42),
            child: Column(
              children: [
                SvgPicture.asset('svg/logo.svg'),
                SizedBox(height: 50),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(children: [
                    TwoTabContainer(
                      leftTabName: 'Sign up',
                      rightTabName: 'Login',
                      leftTabScreen: SignUpScreen(spaceBetweenFields: 10),
                      rightTabScreen: Login(spaceBetweenFields: 30),
                      changeTab: changeTab,
                      selectedTab: selectedTap,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        children: [
                          Expanded(child: Divider()),
                          Text('or continue with', style: k12_400_97GreyText),
                          Expanded(child: Divider())
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset('svg/google.svg'),
                          onTap: () {
                            user.signInWithGoogle();
                          },
                        ),
                        SizedBox(width: 30),
                        GestureDetector(
                          child: SvgPicture.asset('svg/facebook.svg'),
                        )
                      ],
                    )
                  ]),
                ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
