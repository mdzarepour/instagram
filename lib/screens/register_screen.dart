import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';
import 'package:instagram/components/global_widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _backGround(),
          _bottomSection(size: size, theme: theme),
        ],
      ),
    );
  }

  Expanded _backGround() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: GradientColors.registerScreenBackgroundGradient,
          image: DecorationImage(
            alignment: Alignment(0, -0.63),
            image: AssetImage('assets/images/rocket.png'),
          ),
        ),
      ),
    );
  }

  _bottomSection({required Size size, required ThemeData theme}) {
    return Container(
      height: size.height / 2.0,
      decoration: BoxDecoration(
        color: SolidColors.backGroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(36),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign in to',
                style: theme.textTheme.bodyLarge,
              ),
              Image.asset('assets/images/mood.png')
            ],
          ),
          SizedBox(
            height: size.height / 17.73,
          ),
          SizedBox(
            width: size.width / 1.25,
            height: size.height / 17,
            child: TextField(
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: SolidColors.whiteColor),
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ),
          SizedBox(
            height: size.height / 20.95,
          ),
          SizedBox(
            width: size.width / 1.25,
            height: size.height / 17,
            child: TextField(
              obscureText: true,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: SolidColors.whiteColor),
              decoration: InputDecoration(labelText: 'Password'),
            ),
          ),
          SizedBox(
            height: size.height / 28,
          ),
          GlobalWidgets(theme: theme).pinkButton('sign in'),
          GlobalWidgets(theme: theme).buttonsRow(),
        ],
      ),
    );
  }
}
