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
        elevatedButtonTheme: elevatedButton(context),
      ),
      debugShowCheckedModeBanner: false,
      home: SwitchAccount(),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      //for => white bold texts and buttons text
      headlineMedium: TextStyle(
        color: SolidColors.whiteColor,
        fontFamily: 'GB',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      //for => grey bold texts and buttons text
      headlineLarge: TextStyle(
        color: SolidColors.greyLinkColor,
        fontFamily: 'GB',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      //for = > very small white profile screen texts
      headlineSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          fontFamily: 'GN',
          color: SolidColors.whiteColor),
      //for => white thin titles
      titleMedium: TextStyle(
          fontFamily: 'GR',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: SolidColors.whiteColor),
      //for => white bold title and numbers
      titleLarge: TextStyle(
          fontFamily: 'GB',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: SolidColors.whiteColor),
      //for = > white small tags
      titleSmall: TextStyle(
        fontFamily: 'GB',
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: SolidColors.whiteColor,
      ),
      //for => medium persian texts
      displayMedium: TextStyle(
        fontFamily: 'SMedium',
        color: SolidColors.whiteColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      //for => small persian texts
      displaySmall: TextStyle(
        color: SolidColors.whiteColor,
        fontSize: 10,
        fontFamily: 'SMedium',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  elevatedButton(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          backgroundColor: SolidColors.pinkButtonColor,
          fixedSize: Size(129, 46),
          elevation: 0),
    );
  }
}
