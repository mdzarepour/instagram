import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';
import 'package:instagram/components/global_widgets.dart';
import 'package:instagram/components/strings.dart';

class SwitchAccount extends StatelessWidget {
  const SwitchAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: SolidColors.backGroundColor,
        image: const DecorationImage(
          opacity: 0.10,
          repeat: ImageRepeat.repeat,
          image: AssetImage('assets/images/pattern1.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            children: [
              _buildBackground(size, theme),
              _buildGlassyContainer(theme, size),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildBackground(Size size, ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: size.height / 125),
        Image.asset(
          'assets/images/switch_account_background.png',
          width: size.width,
        ),
        const Expanded(child: SizedBox()),
        GlobalWidgets(theme: theme).buttonsRow(),
        SizedBox(height: size.height / 12.2),
      ],
    );
  }

  Center _buildGlassyContainer(ThemeData theme, Size size) {
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: size.width / 1.25,
            height: size.height / 2.59,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: GradientColors.glassyContainer,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/profile.png',
                    filterQuality: FilterQuality.high,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    SwitchAccountScreenStrings.name,
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      SwitchAccountScreenStrings.confirm,
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    SwitchAccountScreenStrings.switchAccount,
                    style: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
