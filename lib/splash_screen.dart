import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:instagram/components/colors.dart';
import 'package:instagram/components/strings.dart';
import 'package:instagram/home_page.dart';

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: SolidColors.accentBlue,
          image: DecorationImage(
            opacity: 0.09,
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
              _buildFooterText(),
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

  Widget _buildFooterText() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: UiString.splashFrom,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: UiString.splashFlutter,
              style: Theme.of(context).textTheme.headlineSmall,
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
            CupertinoPageRoute(builder: (context) => HomePage()),
          );
        }
      },
    );
  }
}
