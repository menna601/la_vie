import 'package:flutter/material.dart';
import 'package:la_vie/model/user.dart';
import 'package:la_vie/web_platform/dialog/verify_otp.dart';

import '../../constansts.dart';
import '../Component/custom_field.dart';

class SendOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email = '';
    return Column(
      children: [
        CustomField(onChanged: (val) {
          email = val;
        }),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              AppUser.sendOTP(email);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerifyOTP(email: email)));
            },
            child: Text('Send OTP', style: k18_500Text),
            style: TextButton.styleFrom(
                backgroundColor: Color(0xFF1ABC00),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    );
  }
}
