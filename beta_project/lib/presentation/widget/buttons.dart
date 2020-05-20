import 'package:beta_project/core/globals.dart';
import 'package:flutter/material.dart';

class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.themeData,
    this.width,
  }) : super(key: key);

  final String text;
  final double width;
  final ThemeData themeData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = themeData.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        width: width ?? MediaQuery.of(context).size.width * 0.5,
        height: kMinInteractiveDimension,
        decoration: BoxDecoration(
          color: themeData.scaffoldBackgroundColor.withOpacity(kLightOpacity),
          border: Border.all(
            color: themeData.primaryColor,
          ),
          borderRadius: BorderRadius.circular(kSpacingXLarge),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: themeData.textTheme.button.copyWith(
              color: isDarkMode ? Colors.white : themeData.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.themeData,
    this.disabled = false,
    this.width,
  }) : super(key: key);

  final bool disabled;
  final String text;
  final double width;
  final ThemeData themeData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = themeData.brightness == Brightness.dark;

    return GestureDetector(
      onTap: disabled ? null : onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        width: width ?? MediaQuery.of(context).size.width * 0.5,
        height: kMinInteractiveDimension,
        decoration: BoxDecoration(
          color: disabled
              ? isDarkTheme
                  ? themeData.scaffoldBackgroundColor
                  : themeData.disabledColor
              : themeData.accentColor,
          borderRadius: BorderRadius.circular(kSpacingXLarge),
        ),
        child: Center(
          child: Text(
            text,
            style: themeData.textTheme.button.copyWith(
              color: disabled
                  ? isDarkTheme ? Colors.grey : Colors.black87
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  final ThemeData themeData;
  final Function onPressed;
  final String text;
  final IconData icon;
  final Color color;

  const ButtonWithIcon({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.onPressed,
    @required this.themeData,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      height: kButtonHeight,
      margin: EdgeInsets.symmetric(horizontal: _size.width * 0.25),
      width: _size.width * 0.5,
      child: RaisedButton.icon(
        onPressed: onPressed,
        label: Text(
          text.toUpperCase(),
          style: themeData.textTheme.button,
          softWrap: true,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSpacingLarge),
        ),
        icon: Icon(icon),
        color: color ?? themeData.primaryColor,
        textColor: themeData.primaryTextTheme.button.color,
        disabledColor: themeData.disabledColor.withOpacity(.5),
        disabledTextColor: themeData.primaryTextTheme.button.color,
      ),
    );
  }
}

class ButtonClear extends FlatButton {
  ButtonClear({
    @required String text,
    @required Function onPressed,
    @required ThemeData themeData,
    bool enabled = true,
    Color textColor,
  }) : super(
          child: Text(
            text,
            style: themeData.textTheme.button.copyWith(
              color: textColor == null || enabled
                  ? themeData.primaryColor
                  : textColor ?? themeData.disabledColor,
            ),
          ),
          onPressed: enabled ? onPressed : null,
          color: enabled
              ? themeData.primaryColor.withOpacity(0)
              : themeData.disabledColor,
          disabledColor: themeData.primaryColor.withOpacity(0),
          disabledTextColor: themeData.disabledColor,
        );
}
