import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/web_platform/screens/two_tab_container.dart';
import 'package:provider/provider.dart';

import '../../constansts.dart';
import '../../model/user.dart';
import '../Component/custom_field.dart';

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
