// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';

class ColorsSheme {
  final Color warmPeach = const Color(0xffFFcba4);
  final Color darkSlateGray = const Color(0xff2f4f4f);
  final Color mintGreen = const Color(0xffa8e6cf);
  final Color brightSkyBlue = const Color(0xff1fbcf0);

  final Color canvas = Colors.white; //const Color(0xfff2f6f9);
  final Color canvas2 = const Color(0xffFFcba4); //0xfff2f6f9);
  final Color canvas3 = const Color.fromARGB(255, 252, 250, 250); //0xfff2f6f9);
  final Color navigationBg = Colors.white;
  final Color navigatActiveIcon = Colors.orange;
  final Color navigatUnactiveIcon = Colors.grey[400]!;
  final Color appbarbg = Colors.transparent;
  final Color appBarShadow = Colors.grey[300]!;
  final Color appBarIcon = Colors.grey;
  final Color switchActiv = const Color(0xffFF8C00);
  final Color switchUnActiv = Colors.grey[300]!;
  final Color switchActivBg = const Color(0xffFFB366);
  final Color switchBg = Colors.grey[200]!;
  final Color text = Colors.black;

  // final Color background = const Color(0xffFBFBFB);

  final Color grey30 = const Color(0xffF7F5F4);
  final Color grey40 = const Color(0xffEEEEEE);
  final Color grey50 = const Color(0xffCCCCCC);
  final Color grey60 = const Color(0xffB2B2B2);
  final Color grey70 = const Color(0xff999999);
  final Color grey80 = const Color(0xff7F7F7F);
  final Color grey90 = const Color(0xff666666);
  final Color grey100 = const Color(0xff4C4C4C);
  final Color grey200 = const Color(0xff333333);
  final Color grey300 = const Color(0xff1A1A1A);
  final Color grey400 = const Color(0xff000000);
  final Color grey500 = const Color(0xff000000);
  final Color card = const Color(0xffD6D3D2);

  final Color orange30 = const Color(0xffFFF5EF);
  final Color orange50 = const Color(0xffFFF9F2);
  final Color orange60 = const Color(0xffFFF2E5);
  final Color orange70 = const Color(0xffFFE5CC);
  final Color orange80 = const Color(0xffFFD699);
  final Color orange90 = const Color(0xffFFCC80);
  final Color orange100 = const Color(0xffFFB366);
  final Color orange200 = const Color(0xffFFA500);
  final Color orange300 = const Color(0xffFF8C00);
  final Color orange400 = const Color(0xffFF6A00);

  final Color orange500 = const Color(0xff995700);

  final red = Colors.red;
  final danger = const Color(0xffC90000);

  final Color mainColor = const Color(0xff0F7EEC);
  final Color primary50 = const Color(0xff0762C8).withOpacity(0.1);
  final Color primaryMain = const Color(0xff04579D);

  final Color blueHover = const Color(0xff0058C6);
  final Color coralRed = const Color(0xffEA2C2C);
  final Color schoolBus = const Color(0xffFF6600);
  final Color success = const Color(0xff2A9F3E);

  final Color black = const Color(0xff161616);
  final Color secondaryBlack = const Color(0xff161616).withOpacity(0.05);
  final Color white = const Color(0xffffffff);
  final Color porcelain = const Color(0xffE9EBED);
  final Color athensGray = const Color(0xffCED4DA);
  final Color mountainMist = const Color(0xff6D757D);
  final Color alabaster = const Color(0xffE9ECEF);
  final Color background = const Color(0xffF0F1F2);
  final Color background2 = const Color(0xffF2F6F9);
}

class ColorsDark extends ColorsSheme {
  final Color warmPeach = Colors.black;
  final Color canvas = Colors.grey[800]!;
  final Color canvas2 = const Color.fromARGB(255, 27, 30, 32);
  // final Color appbarbg = Colors.black;
  final Color appBarIcon = Colors.white;
  final Color text = Colors.white;
  final Color navigationBg = Colors.grey[800]!;
  final Color navigatActiveIcon = Colors.orange[700]!;
  final Color navigatUnactiveIcon = Colors.grey[400]!;
  final Color background = const Color(0xffFBFBFB);
  final Color grey500 = const Color(0xffF5F5F5);
  final Color grey400 = const Color(0xffE5E5E5);
  final Color grey300 = const Color(0xffCCCCCC);
  final Color grey200 = const Color(0xffB2B2B2);
  final Color grey100 = Colors.grey[200]!; // const Color(0xff999999);
  final Color grey90 = const Color(0xff7F7F7F);
  final Color grey80 = const Color(0xff666666);
  final Color grey70 = const Color(0xff4C4C4C);
  final Color grey60 = const Color(0xff333333);
  final Color grey50 = const Color(0xff1A1A1A);

  final Color orange50 = const Color(0xffFFE5CC);
  final Color orange60 = const Color(0xffFFD699);
  final Color orange70 = const Color(0xffFFCC80);
  final Color orange80 = const Color(0xffFFB366);
  final Color orange90 = const Color(0xffFFA500);
  final Color orange100 = const Color(0xffFF8C00);
  final Color orange200 = const Color(0xffFF7200);
  final Color orange300 = const Color(0xffCC5700);
  final Color orange400 = const Color(0xff994C00);
  final Color orange500 = const Color(0xff662E00);

  final danger = Colors.red;
}
