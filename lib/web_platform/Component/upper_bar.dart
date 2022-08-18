import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constansts.dart';
import '../screens/two_tab_container.dart';

class UpperBar extends StatelessWidget {
  UpperBar({this.changeTab});
  final Function(TabStatus)? changeTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
      child: Row(
        children: [
          SvgPicture.asset('svg/logo.svg', height: 42, width: 103),
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text('Home', style: k14_400BlackText)),
                  TextButton(
                      onPressed: () {},
                      child: Text('About', style: k14_400BlackText)),
                  TextButton(
                      onPressed: () {},
                      child: Text('Shop', style: k14_400BlackText)),
                  TextButton(
                      onPressed: () {},
                      child: Text('Blog', style: k14_400BlackText)),
                ],
              )),
          ElevatedButton(
            onPressed: () {
              if (changeTab != null) changeTab!(TabStatus.leftTab);
            },
            style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
            child: Text('Sign Up', style: k12_500Text),
          )
        ],
      ),
    );
  }
}
