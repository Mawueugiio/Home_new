import 'package:beta_project/core/globals.dart';
import 'package:flutter/material.dart';

class KThemes {
  static final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    accentColor: kSecondaryColor,
    buttonColor: kPrimaryColor,
    backgroundColor: kLightColor,
    dialogBackgroundColor: kLightColor,
    dialogTheme: DialogTheme(
      shape: kDialogShape,
      titleTextStyle: kDialogTitleStyle.copyWith(fontFamily: kDefaultFontFamily),
      contentTextStyle:
      kDialogSubtitleStyle.copyWith(fontFamily: kSecondaryFontFamily),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontFamily: kSecondaryFontFamily,
      ),
      labelStyle: TextStyle(
          fontSize: 16,
          fontFamily: kSecondaryFontFamily,
          fontWeight: FontWeight.w600),
      unselectedLabelColor: kDisabledColor,
    ),
    disabledColor: kDisabledColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSpacingXLarge),
      ),
      elevation: 2.0,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      elevation: kSpacingNone,
      iconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      actionsIconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: kDefaultFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: kPrimaryColor,
        ),
      ),
      color: kLightColor.withOpacity(kSpacingNone),
    ),
    scaffoldBackgroundColor: kLightColor,
    bottomAppBarColor: kLightColor,
    textTheme: TextTheme(
      overline: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.black54,
      ),
      bodyText1: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      caption: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black54,
      ),
      bodyText2: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      ),
      button: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headline1: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 96,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 60,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headline3: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 34,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      subtitle2: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kDarkPrimaryColor,
    accentColor: kDarkAccentColor,
    buttonColor: kDarkAccentColor,
    backgroundColor: Color(0xff222222),
    dialogBackgroundColor: Color(0xff222222),
    dialogTheme: DialogTheme(
      shape: kDialogShape,
      titleTextStyle: kDialogTitleStyle.copyWith(fontFamily: kDefaultFontFamily),
      contentTextStyle:
      kDialogSubtitleStyle.copyWith(fontFamily: kSecondaryFontFamily),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontFamily: kSecondaryFontFamily,
      ),
      labelStyle: TextStyle(
          fontSize: 16,
          fontFamily: kSecondaryFontFamily,
          fontWeight: FontWeight.w600),
      unselectedLabelColor: kDisabledColorDark,
    ),
    disabledColor: kDisabledColorDark,
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSpacingXLarge),
      ),
      elevation: 2.0,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      elevation: kSpacingNone,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: kDefaultFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      color: Color(0xff222222).withOpacity(kDefaultOpacity),
    ),
    scaffoldBackgroundColor: Color(0xff222222),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      button: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline1: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 96,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline2: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 60,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline3: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline4: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontFamily: kDefaultFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: kDarkAccentColor,
      actionTextColor: kDarkPrimaryColor,
      contentTextStyle: TextStyle(
        fontFamily: kSecondaryFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
