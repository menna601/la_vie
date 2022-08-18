import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/constansts.dart';

enum TabStatus { leftTab, rightTab }

class TwoTabContainer extends StatelessWidget {
  TwoTabContainer(
      {required this.leftTabName,
      required this.rightTabName,
      required this.leftTabScreen,
      required this.rightTabScreen,
      required this.selectedTab,
      required this.changeTab});

  final String leftTabName;
  final String rightTabName;
  final Widget leftTabScreen;
  final Widget rightTabScreen;
  final TabStatus selectedTab;
  final Function(TabStatus) changeTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: kIsWeb
              ? BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0x42000000))))
              : null,
          child: Row(
            children: [
              Expanded(flex: 2, child: Container()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: selectedTab == TabStatus.leftTab
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: kGreen, width: 3),
                        ),
                      )
                    : null,
                child: TextButton(
                  onPressed: () {
                    changeTab(TabStatus.leftTab);
                  },
                  child: Text(
                    leftTabName,
                    style: selectedTab == TabStatus.leftTab
                        ? kIsWeb
                            ? k26_600GreenText
                            : k18_600GreenText
                        : kIsWeb
                            ? k26_400BlackText
                            : k18_400GreenText,
                  ),
                ),
              ),
              Expanded(child: Container()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: selectedTab == TabStatus.rightTab
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: kGreen, width: 3),
                        ),
                      )
                    : null,
                child: TextButton(
                  onPressed: () {
                    changeTab(TabStatus.rightTab);
                  },
                  child: Text(
                    rightTabName,
                    style: selectedTab == TabStatus.rightTab
                        ? kIsWeb
                            ? k26_600GreenText
                            : k18_600GreenText
                        : kIsWeb
                            ? k26_400BlackText
                            : k18_400GreenText,
                  ),
                ),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kIsWeb ? 150 : 0),
          child:
              selectedTab == TabStatus.leftTab ? leftTabScreen : rightTabScreen,
        ),
      ],
    );
  }
}
