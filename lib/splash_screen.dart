import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:instagram/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundColor = HexColor('#1C1F2E');

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
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
    return SvgPicture.asset(
      'assets/images/Startlogo.svg',
      semanticsLabel: 'App Logo',
    );
  }

  Widget _buildFooterText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: """FROM      
expertflutter.pro""",
        ),
        style: const TextStyle(color: Colors.grey),
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
