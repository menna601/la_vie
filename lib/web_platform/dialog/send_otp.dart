import 'package:flutter/material.dart';
import 'package:la_vie/routes/routes.dart';

import '../../constansts.dart';
import '../../model/user.dart';
import '../Component/custom_field.dart';

class SendOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email = '';
    return Center(
      child: Container(
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(
                label: 'Email',
                onChanged: (val) {
                  email = val;
                }),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  AppUser.sendOTP(email);
                  navKey.currentState!
                      .pushNamed(verifyOTP, arguments: {'email': email});
                },
                child: Text('Send OTP', style: k18_500Text),
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
