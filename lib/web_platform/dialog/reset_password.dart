import 'package:flutter/material.dart';

import '../../constansts.dart';
import '../../model/user.dart';
import '../../routes/routes.dart';
import '../Component/custom_field.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({required this.args});
  final args;
  @override
  Widget build(BuildContext context) {
    String password = '';
    return Center(
      child: Container(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(
                label: 'New password',
                onChanged: (val) {
                  password = val;
                }),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  AppUser.resetPassword(args['email'], password, args['otp']);
                  navKey.currentState!.popUntil(ModalRoute.withName(index));
                },
                child: Text('Reset password', style: k18_500Text),
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
    ;
  }
}
