import 'package:flutter/material.dart';

//Colors
const kGreen = Color(0xFF1ABC00);
const kFAGrey = Color(0XFFFAFAFA);
const k65Grey = Color(0xFF656565);
const k6FGrey = Color(0xFF6F6F6F);
const k8AGrey = Color(0xFF8A8A8A);
const k90Grey = Color(0xFF909090);
const k93Grey = Color(0xFF939393);
const k97Grey = Color(0xFF979797);

//TextStyles

const k6_400GreenText = TextStyle(
  fontSize: 6,
  color: kGreen,
  fontWeight: FontWeight.w400,
);
const k10_400GreenText = TextStyle(
  fontSize: 10,
  color: k90Grey,
  fontWeight: FontWeight.w400,
);
const k10_500GreenText = TextStyle(
  fontSize: 10,
  color: kGreen,
  fontWeight: FontWeight.w500,
);
const k12_400Text = TextStyle(
  fontSize: 12,
  color: k97Grey,
  fontWeight: FontWeight.w400,
);
const k12_500Text = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
);
const k14_400BlackText = TextStyle(
  fontSize: 14, //instead of 24
  color: Colors.black,
  fontWeight: FontWeight.w400,
);
const k14_500GreyText = TextStyle(
  fontSize: 14, //instead of 24
  color: k6FGrey,
  fontWeight: FontWeight.w500,
);
const k18_400GreenText = TextStyle(
  fontWeight: FontWeight.w400,
  color: k8AGrey,
  fontSize: 18,
);
const k18_500Text = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 18,
);
const k18_600GreenText = TextStyle(
  fontWeight: FontWeight.w600,
  color: kGreen,
  fontSize: 18,
);
const k20_500DarkGreyText = TextStyle(
  fontSize: 20,
  color: k65Grey,
  fontWeight: FontWeight.w500,
);
const k20_500MediumGreyText = TextStyle(
  fontSize: 20,
  color: k93Grey,
  fontWeight: FontWeight.w500,
);
const k20_500GreenUText = TextStyle(
    fontSize: 20,
    color: kGreen,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline);
const k20_500GreenText = TextStyle(
  fontSize: 20,
  color: kGreen,
  fontWeight: FontWeight.w500,
);
const k26_400BlackText = TextStyle(
  fontSize: 26,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);
const k26_600GreenText = TextStyle(
  fontSize: 26,
  color: kGreen,
  fontWeight: FontWeight.w600,
);

//BoxDecorations

const UnderlineBorderGreenDec = BoxDecoration(
  border: Border(
    bottom: BorderSide(width: 3, color: kGreen),
  ),
);
