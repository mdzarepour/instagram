import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SolidColors {
  static Color backGroundColor = Color(0xff1C1F2E);
  static Color pinkButtonColor = Color(0xffF35383);
  static Color greyLinkColor = Color(0xffC5C5C5);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color purpleColor = Color(0xffF98BFC);
  static Color blueColor = Color(0xff55B9F7);
}

class GradientColors {
  static LinearGradient glassyContainer = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(255, 255, 255, 0.5),
      Color.fromRGBO(255, 255, 255, 0.2),
    ],
  );
}
