import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SolidColors {
  static Color backGroundPurple = Color(0xff1C1F2E);
  static Color pu8rpleButton = Color(0xffF35383);
  static Color grayLinkColor = Color(0xffC5C5C5);
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
