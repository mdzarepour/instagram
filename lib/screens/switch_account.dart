import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';
import 'package:instagram/components/strings.dart';

class SwitchAccount extends StatelessWidget {
  const SwitchAccount({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: SolidColors.backGroundPurple,
        image: DecorationImage(
          opacity: 0.10,
          repeat: ImageRepeat.repeat,
          image: AssetImage(
            'assets/images/pattern1.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Stack(
          children: [
            _backGround(size, theme),
            _glassyContainer(theme, size),
          ],
        )),
      ),
    );
  }

  Column _backGround(Size size, ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height / 37,
        ),
        Image.asset(
          'assets/images/switch_account_background.png',
        ),
        Expanded(
          child: SizedBox(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                SwitchAccountScreenStrings.dontHavAccount,
                style: theme.textTheme.headlineMedium,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                SwitchAccountScreenStrings.signUp,
                style: theme.textTheme.headlineLarge,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height / 10.2,
        ),
      ],
    );
  }

  Center _glassyContainer(ThemeData theme, Size size) {
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: 340.0,
            height: 351.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                gradient: GradientColors.glassyContainer),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/profile.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    SwitchAccountScreenStrings.name,
                    style: theme.textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: theme.elevatedButtonTheme.style,
                    onPressed: () {},
                    child: Text(
                      SwitchAccountScreenStrings.confirm,
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    SwitchAccountScreenStrings.switchAccount,
                    style: theme.textTheme.headlineMedium,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
