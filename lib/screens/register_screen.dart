import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';
import 'package:instagram/components/global_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisibility = true;
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _emailFocusNode.unfocus();
          _passwordFocusNode.unfocus();
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _backGround(),
            _bottomSection(size: size, theme: theme),
          ],
        ),
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

  _bottomSection({required Size size, required theme}) {
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
          // => header
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
          // => email input
          SizedBox(
            width: size.width / 1.25,
            height: size.height / 17,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocusNode,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: SolidColors.whiteColor),
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ),
          SizedBox(
            height: size.height / 20.95,
          ),
          // => password input
          SizedBox(
            width: size.width / 1.25,
            height: size.height / 17,
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              focusNode: _passwordFocusNode,
              obscureText: passwordVisibility,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: SolidColors.whiteColor),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    _visiblePassword();
                  },
                  child: Icon(
                    CupertinoIcons.eye,
                    color: Colors.white,
                  ),
                ),
                labelText: 'Password',
              ),
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

  _visiblePassword() {
    setState(() {
      passwordVisibility == false
          ? passwordVisibility = true
          : passwordVisibility = false;
    });
  }
}
