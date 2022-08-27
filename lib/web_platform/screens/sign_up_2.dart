import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:la_vie/constansts.dart';
import 'package:la_vie/model/user.dart';
import 'package:la_vie/web_platform/screens/sign_up_screen.dart';
import 'package:la_vie/web_platform/screens/two_tab_container.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SignUp2 extends StatefulWidget {
  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
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
      backgroundColor: kFAGrey,
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(top: 100, child: SvgPicture.asset('svg/brown_leaf.svg')),
          Positioned(
              bottom: -30,
              right: -200,
              child: Transform(
                  transform: Matrix4.rotationY(math.pi),
                  child: SvgPicture.asset('svg/brown_leaf.svg'))),
          Padding(
            padding: EdgeInsets.only(left: 80, right: 80, top: 30),
            child: Column(
              children: [
                TwoTabContainer(
                  leftTabName: 'Sign up',
                  rightTabName: 'Login',
                  leftTabScreen: SignUpScreen(
                      spaceBetweenFields: 40, changeTab: changeTab),
                  rightTabScreen:
                      Login(spaceBetweenFields: 40, changeTab: changeTab),
                  selectedTab: selectedTap,
                  changeTab: changeTab,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 180),
                  child: Row(
                    children: [
                      Expanded(child: Divider()),
                      Text('or continue with', style: k6_400GreenText),
                      Expanded(child: Divider())
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: TextButton.icon(
                              onPressed: () {
                                user.signInWithGoogle();
                              },
                              icon: SvgPicture.asset('svg/google.svg'),
                              label: Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text('Continue with Google',
                                      style: k20_500GreenText)),
                              style: TextButton.styleFrom(
                                  backgroundColor: kFAGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Color(0xFF1ABC00))))),
                        ),
                      ),
                      SizedBox(width: 100),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: TextButton.icon(
                              onPressed: () {
                                AppUser.signInWithFacebook();
                              },
                              icon: SvgPicture.asset('svg/facebook.svg'),
                              label: Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text('Continue with Facebook',
                                      style: k20_500GreenText)),
                              style: TextButton.styleFrom(
                                  backgroundColor: kFAGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Color(0xFF1ABC00))))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 90)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
