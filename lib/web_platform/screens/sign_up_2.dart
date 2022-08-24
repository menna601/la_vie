import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:la_vie/constansts.dart';
import 'package:la_vie/model/user.dart';
import 'package:la_vie/web_platform/screens/two_tab_container.dart';
import 'package:provider/provider.dart';

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
                              onPressed: () {},
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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({required this.spaceBetweenFields, this.changeTab});
  final double spaceBetweenFields;
  final Function(TabStatus)? changeTab;

  @override
  Widget build(BuildContext context) {
    String fName = '';
    String lName = '';
    String email = '';
    String password = '';
    String passwordCheck = '';
    final user = Provider.of<AppUser>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: CustomField(
                    label: 'First Name',
                    onChanged: (value) {
                      fName = value;
                    })),
            SizedBox(width: kIsWeb ? 96 : 20),
            Expanded(
                child: CustomField(
                    label: 'Last Name',
                    onChanged: (value) {
                      lName = value;
                    }))
          ],
        ),
        SizedBox(height: spaceBetweenFields),
        CustomField(
            label: 'Email',
            onChanged: (value) {
              email = value;
            }),
        SizedBox(height: spaceBetweenFields),
        CustomField(
            label: 'Password',
            onChanged: (value) {
              password = value;
            }),
        SizedBox(height: spaceBetweenFields),
        CustomField(
            label: 'Password',
            onChanged: (value) {
              passwordCheck = value;
            }),
        SizedBox(height: spaceBetweenFields),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Map<String, dynamic> data = {
                'firstName': fName,
                'lastName': lName,
                'email': email,
                'password': password
              };
              user.signUp(data);
            },
            child: Text('Sign up', style: k18_500Text),
            style: TextButton.styleFrom(
                backgroundColor: Color(0xFF1ABC00),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        SizedBox(height: 10),
        if (kIsWeb)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account? ', style: k10_400GreyText),
              TextButton(
                  onPressed: () {
                    if (changeTab != null) changeTab!(TabStatus.rightTab);
                  },
                  child: Text('Sign in', style: k10_500GreenText))
            ],
          ),
      ],
    );
  }
}

class Login extends StatefulWidget {
  Login({required this.spaceBetweenFields, this.changeTab});
  final double spaceBetweenFields;
  final Function(TabStatus)? changeTab;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    AppUser _user = Provider.of<AppUser>(context, listen: false);
    return Column(children: [
      CustomField(
          label: 'Email',
          onChanged: (value) {
            email = value;
          }),
      SizedBox(height: widget.spaceBetweenFields),
      CustomField(
          label: 'Password',
          onChanged: (value) {
            password = value;
          }),
      if (kIsWeb)
        Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                  activeColor: kGreen,
                  value: rememberMe,
                  onChanged: (val) {
                    setState(() {
                      rememberMe = val!;
                    });
                  },
                ),
                title: Text('Remember me', style: k20_500MediumGreyText),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Forget password ?',
                  style: k20_500GreenUText,
                ))
          ],
        ),
      SizedBox(height: widget.spaceBetweenFields),
      SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () async {
            await _user.signIn(email, password, rememberMe);
          },
          child: Text('Login', style: k18_500Text),
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFF1ABC00),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
      SizedBox(height: 10),
      if (kIsWeb)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account? ', style: k10_400GreyText),
            TextButton(
                onPressed: () {
                  if (widget.changeTab != null)
                    widget.changeTab!(TabStatus.leftTab);
                },
                child: Text(
                  'Sign up',
                  style: k10_500GreenText,
                ))
          ],
        ),
    ]);
  }
}

class CustomField extends StatelessWidget {
  CustomField(
      {this.label,
      this.hint,
      this.borderColor,
      this.height,
      this.border = true,
      required this.onChanged});
  final String? label;
  final String? hint;
  final Color? borderColor;
  final double? height;
  final Function(String) onChanged;
  final bool border;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != null
          ? height
          : kIsWeb
              ? 104
              : 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: kIsWeb ? k20_500DarkGreyText : k14_500GreyText,
            ),
          if (label != null) SizedBox(height: 10),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  hintText: hint,
                  focusedBorder: border
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFF1ABC00)))
                      : InputBorder.none,
                  border: border
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))
                      : InputBorder.none),
              cursorColor: borderColor ?? Color(0xFF1ABC00),
            ),
          ),
        ],
      ),
    );
  }
}
