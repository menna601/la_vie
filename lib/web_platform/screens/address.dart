import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constansts.dart';
import '../../model/user.dart';
import '../Component/custom_field.dart';

class Address extends StatelessWidget {
  Widget build(BuildContext context) {
    String address = '';
    AppUser _user = Provider.of<AppUser>(context).user;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 120),
          child: Dialog(
              child: Row(
            children: [
              Expanded(
                  child: Image.asset(
                'images/plants-gardening-tools.png',
                fit: BoxFit.fill,
              )),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 40, left: 34, right: 34),
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset('svg/logo.svg'),
                      SizedBox(height: 40),
                      Text(
                        'Get Seeds For Free',
                        style: TextStyle(
                          fontFamily: 'Karantina',
                          fontSize: 45,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 6,
                        ),
                      ),
                      Text('Enter Your Address', style: k16_500Text),
                      SizedBox(height: 40),
                      CustomField(
                          height: 90,
                          hint: 'Address',
                          onChanged: (val) {
                            address = val;
                          }),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              _user.addAddress(address);
                            },
                            child: Text('Send', style: k24_500Text)),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {},
                          child:
                              Text('Save For Later', style: k24_500_97GreyText),
                          style: ElevatedButton.styleFrom(primary: kF0White),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          )),
        ),
      );
    });
    return Container();
  }
}
