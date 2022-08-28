import 'package:flutter/material.dart';
import 'package:la_vie/routes/routes.dart';

import '../../constansts.dart';
import '../../model/user.dart';
import '../Component/custom_field.dart';

class VerifyOTP extends StatelessWidget {
  VerifyOTP({required this.args});
  final args;
  @override
  Widget build(BuildContext context) {
    String otp = '';
    return Center(
      child: Container(
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(
                label: 'OTP',
                onChanged: (val) {
                  otp = val;
                }),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  AppUser.verifyOTP(args['email'], otp);
                  Navigator.of(context).pushNamed(resetPassword,
                      arguments: {'email': args['email'], 'otp': otp});
                },
                child: Text('Verify OTP', style: k18_500Text),
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF1ABC00),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
