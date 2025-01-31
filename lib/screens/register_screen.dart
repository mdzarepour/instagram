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
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_updateState);
    _passwordFocusNode.addListener(_updateState);
  }

  @override
  void dispose() {
    _passwordFocusNode.removeListener(_updateState);
    _emailFocusNode.removeListener(_updateState);
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _updateState() {
    setState(() {});
  }

  void _togglePasswordVisibility() {
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _emailFocusNode.unfocus();
          _passwordFocusNode.unfocus();
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _buildBackground(),
            _buildBottomSection(size: size, theme: theme),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: GradientColors.registerScreenBackgroundGradient,
        image: const DecorationImage(
          alignment: Alignment(0, -0.63),
          image: AssetImage('assets/images/rocket.png'),
        ),
      ),
    );
  }

  Widget _buildBottomSection({required Size size, required ThemeData theme}) {
    return Container(
      height: size.height / 2.0,
      decoration: BoxDecoration(
        color: SolidColors.backGroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(36),
        ),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          _buildHeader(theme),
          SizedBox(height: size.height / 17.73),
          _buildEmailInput(size: size, theme: theme),
          SizedBox(height: size.height / 20.95),
          _buildPasswordInput(size: size, theme: theme),
          SizedBox(height: size.height / 28),
          GlobalWidgets(theme: theme).pinkButton('sign in'),
          GlobalWidgets(theme: theme).buttonsRow(),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Sign in to', style: theme.textTheme.bodyLarge),
        Image.asset('assets/images/mood.png'),
      ],
    );
  }

  Widget _buildEmailInput({required Size size, required ThemeData theme}) {
    return SizedBox(
      width: size.width / 1.25,
      height: size.height / 17,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        focusNode: _emailFocusNode,
        style:
            theme.textTheme.bodyMedium!.copyWith(color: SolidColors.whiteColor),
        decoration: InputDecoration(
          labelText: 'Email',
          floatingLabelStyle: _emailFocusNode.hasFocus
              ? theme.textTheme.bodyMedium
              : theme.textTheme.bodyMedium!
                  .copyWith(color: SolidColors.whiteColor),
        ),
      ),
    );
  }

  Widget _buildPasswordInput({required Size size, required ThemeData theme}) {
    return SizedBox(
      width: size.width / 1.25,
      height: size.height / 17,
      child: TextField(
        keyboardType: TextInputType.text,
        focusNode: _passwordFocusNode,
        obscureText: passwordVisibility,
        style:
            theme.textTheme.bodyMedium!.copyWith(color: SolidColors.whiteColor),
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: _togglePasswordVisibility,
            child: Icon(
              passwordVisibility
                  ? CupertinoIcons.eye_slash
                  : CupertinoIcons.eye,
              color: SolidColors.whiteColor,
            ),
          ),
          labelText: 'Password',
          floatingLabelStyle: _emailFocusNode.hasFocus
              ? theme.textTheme.bodyMedium
              : theme.textTheme.bodyMedium!
                  .copyWith(color: SolidColors.whiteColor),
        ),
      ),
    );
  }
}
