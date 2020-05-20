import 'package:flutter/material.dart';

class SuccessSnackBar extends SnackBar {
  SuccessSnackBar(String text, {int seconds = 5, TextStyle style})
      : super(
          content: Text(
            text,
            style: style,
          ),
          duration: Duration(seconds: seconds),
          backgroundColor: Colors.green,
        );

  static void show(BuildContext context, String text, {int seconds = 5}) {
    Scaffold.of(context).showSnackBar(
      SuccessSnackBar(
        text,
        seconds: seconds,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}

class ErrorSnackBar extends SnackBar {
  ErrorSnackBar(String text, {int seconds = 5, TextStyle style})
      : super(
          content: Text(
            text,
            style: style,
          ),
          duration: Duration(seconds: seconds),
          backgroundColor: Colors.redAccent,
        );

  static void show(BuildContext context, String text, {int seconds = 5}) {
    var themeData = Theme.of(context);
    Scaffold.of(context).showSnackBar(ErrorSnackBar(
      text,
      seconds: seconds,
      style: themeData.textTheme.bodyText1.copyWith(color: Colors.white),
    ));
  }
}
