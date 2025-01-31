import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';
import 'package:instagram/screens/home_screen.dart';

void main(List<String> args) {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: appbarTheme(),
        inputDecorationTheme: textFieldTheme(context),
        textTheme: textTheme(),
        elevatedButtonTheme: elevatedButton(context),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'GB',
        fontSize: 14,
        letterSpacing: 1.4,
        fontWeight: FontWeight.w400,
        color: SolidColors.pinkButtonColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'GB',
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: SolidColors.whiteColor,
      ),
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
        color: SolidColors.whiteColor,
      ),
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

  textFieldTheme(BuildContext context) {
    return InputDecorationTheme(
      labelStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: SolidColors.whiteColor),
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(color: SolidColors.greyLinkColor, width: 3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(color: SolidColors.pinkButtonColor, width: 3),
      ),
    );
  }

  appbarTheme() {
    return AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
      titleSpacing: 20,
      backgroundColor: Colors.transparent,
    );
  }
}
