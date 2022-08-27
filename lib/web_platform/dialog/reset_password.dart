import 'package:flutter/material.dart';
import 'package:la_vie/model/user.dart';

import '../../constansts.dart';
import '../../routes/routes.dart';
import '../Component/custom_field.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({required this.email, required this.otp});
  final String email;
  final String otp;

  @override
  Widget build(BuildContext context) {
    String password = '';
    return Column(
      children: [
        CustomField(onChanged: (val) {
          password = val;
        }),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              AppUser.resetPassword(email, password, otp);
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
    );
    ;
  }
}
