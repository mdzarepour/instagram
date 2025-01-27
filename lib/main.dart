import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';
import 'package:instagram/screens/switch_account.dart';

void main(List<String> args) {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: textTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              backgroundColor: SolidColors.pu8rpleButton,
              fixedSize: Size(129, 46),
              elevation: 0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SwitchAccount(),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
        headlineMedium: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: 16,
          color: SolidColors.grayLinkColor,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
          color: Colors.lightBlueAccent,
        ));
  }
}
