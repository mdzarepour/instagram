import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/components/colors.dart';
import 'package:instagram/components/strings.dart';
import 'package:instagram/screens/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: SolidColors.backGroundColor,
          image: DecorationImage(
            opacity: 0.10,
            repeat: ImageRepeat.repeat,
            image: const AssetImage('assets/images/pattern1.png'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              const SizedBox(height: 30),
              _buildFooterText(textTheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Expanded(
      child: SvgPicture.asset(
        'assets/images/Startlogo.svg',
        semanticsLabel: 'App Logo',
      ),
    );
  }

  Widget _buildFooterText(TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              style: textTheme.headlineLarge,
              text: SplashScreenStrings.splashFrom,
            ),
            TextSpan(
              style: textTheme.headlineLarge!.copyWith(
                color: SolidColors.blueColor,
              ),
              text: SplashScreenStrings.splashFlutter,
            )
          ],
        ),
      ),
    );
  }

  void _navigateToHomeScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (context) => RegisterScreen()),
          );
        }
      },
    );
  }
}
