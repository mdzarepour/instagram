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
        color: SolidColors.backGroundColor,
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
          height: size.height / 125,
        ),
        Image.asset(
          width: size.width,
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
                style: theme.textTheme.headlineLarge,
                SwitchAccountScreenStrings.dontHavAccount,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                style: theme.textTheme.headlineMedium,
                SwitchAccountScreenStrings.signUp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height / 12.2,
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
            width: size.width / 1.25,
            height: size.height / 2.59,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                gradient: GradientColors.glassyContainer),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      filterQuality: FilterQuality.high,
                      'assets/images/profile.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    style: theme.textTheme.headlineMedium,
                    SwitchAccountScreenStrings.name,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      style: theme.textTheme.headlineMedium,
                      SwitchAccountScreenStrings.confirm,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    style: theme.textTheme.headlineMedium,
                    SwitchAccountScreenStrings.switchAccount,
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
