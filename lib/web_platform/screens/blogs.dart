import 'package:flutter/material.dart';

import 'home.dart';

class Blogs extends StatelessWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 50.0,
            childAspectRatio: (200 / 220)),
        itemBuilder: (BuildContext context, int index) {
          return BlogItem();
        },
      ),
    );
    ;
  }
}
