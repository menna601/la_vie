import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/web_platform/screens/two_tab_container.dart';
import 'package:provider/provider.dart';

import '../../constansts.dart';
import '../../model/user.dart';
import '../Component/custom_field.dart';

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
