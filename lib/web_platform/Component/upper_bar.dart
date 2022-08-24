import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constansts.dart';
import '../../model/user.dart';
import '../../routes/routes.dart';
import '../screens/two_tab_container.dart';

class UpperBar extends StatelessWidget {
  UpperBar({this.child, this.changeTab});
  final Function(TabStatus)? changeTab;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
      child: child != null
          ? child
          : Row(
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

class UpperSigned extends StatelessWidget {
  const UpperSigned({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppUser _user = Provider.of<AppUser>(context).user;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
      child: Row(
        children: [
          SvgPicture.asset('svg/logo.svg', height: 42, width: 103),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        navKey.currentState!.pushNamed(home);
                      },
                      child: Text('Home', style: k14_400BlackText)),
                  TextButton(
                      onPressed: () {
                        navKey.currentState!.pushNamed(shop);
                      },
                      child: Text('Shop', style: k14_400BlackText)),
                  TextButton(
                      onPressed: () {
                        //navKey.currentState!.pushNamed(blogs);
                      },
                      child: Text('Blog', style: k14_400BlackText)),
                  TextButton(
                      onPressed: () {},
                      child: Text('About', style: k14_400BlackText)),
                  TextButton(
                      onPressed: () {},
                      child: Text('Community', style: k14_400BlackText)),
                ],
              )),
          Row(
            children: [
              GestureDetector(
                child: Icon(Icons.shopping_cart_outlined),
              ),
              GestureDetector(
                child: Icon(Icons.notifications),
              ),
              GestureDetector(
                child: Icon(Icons.person),
              )
            ],
          )
        ],
      ),
    );
  }
}
