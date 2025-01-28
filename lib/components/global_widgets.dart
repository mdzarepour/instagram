import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/components/strings.dart';

class GlobalWidgets {
  final ThemeData theme;
  GlobalWidgets({required this.theme});
  buttonsRow() {
    return Expanded(
      child: Row(
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
    );
  }

  pinkButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: theme.textTheme.headlineMedium,
      ),
    );
  }
}
