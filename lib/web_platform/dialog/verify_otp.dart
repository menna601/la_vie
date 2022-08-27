import 'package:flutter/material.dart';
import 'package:la_vie/model/user.dart';
import 'package:la_vie/web_platform/dialog/reset_password.dart';

import '../../constansts.dart';
import '../Component/custom_field.dart';

class VerifyOTP extends StatelessWidget {
  VerifyOTP({required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    String otp = '';
    return Dialog(
        child: Column(
      children: [
        CustomField(onChanged: (val) {
          otp = val;
        }),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              print(otp);
              AppUser.verifyOTP(email, otp);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ResetPassword(email: email, otp: otp)));
            },
            child: Text('Verify OTP', style: k18_500Text),
            style: TextButton.styleFrom(
                backgroundColor: Color(0xFF1ABC00),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    ));
  }
}
