import 'package:flutter/material.dart';

import 'constant.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    radioTheme: RadioThemeData(
        splashRadius: 30,
        fillColor: MaterialStateProperty.all<Color>(buttonPrymaryColor)),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(inputRadius),
            side: const BorderSide(color: Colors.transparent),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.red)),
        backgroundColor: MaterialStateProperty.all<Color>(buttonPrymaryColor),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: lightBackgroundNavBottomColor,
      selectedItemColor: lightSelectedItemColor,
      unselectedItemColor: lightUnSelectedItemColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      fillColor: lightInputFillColor,
      focusColor: lightInputFillColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: bordeRadius,
        borderSide: BorderSide(
          width: 1,
          color: lightSelectedItemColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: bordeRadius,
        borderSide: BorderSide(
          width: 1,
          color: lightSelectedItemColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: bordeRadius,
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.solid,
          color: errorColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: bordeRadius,
        borderSide: const BorderSide(style: BorderStyle.none),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: bordeRadius,
        borderSide: BorderSide(color: errorColor),
      ),
    ),
    textTheme: TextTheme(
      bodyText2: const TextStyle(
        fontSize: 18,
      ),
      // bodyText1: TextStyle(
      //   color: Colors.red,
      //   fontSize: 18,
      // ),
      headline1: TextStyle(
        color: lightTextColorOnDarkColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      // headline2: TextStyle(
      //   color: Colors.red,
      //   fontSize: 18,
      // ),
      // headline3: TextStyle(
      //   color: Colors.red,
      //   fontSize: 18,
      // ),
      // headline4: TextStyle(
      //   color: Colors.red,
      //   fontSize: 18,
      // ),
      // headline5: TextStyle(
      //   color: Colors.red,
      //   fontSize: 18,
      // ),
      // headline6: TextStyle(
      //   color: Colors.red,
      //   fontSize: 18,
      // ),
      subtitle2: const TextStyle(
        color: Colors.red,
        fontSize: 18,
      ),
      subtitle1: const TextStyle(
        fontSize: 20,
      ),
      // button: TextStyle(
      //   color: Colors.red,
      //   fontSize: 18,
      // ),
      // overline: TextStyle(
      //   color: Colors.red,
      //   fontSize: 18,
      // ),
      // caption: TextStyle(
      //   color: Colors.red,
      //   fontSize: 18,
      // ),
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: lightTextColorOnDarkColor,
        ),
        iconTheme: IconThemeData(
          color: lightTextColorOnDarkColor,
        )),
    colorScheme: ColorScheme(
      background: Colors.red,
      error: Colors.red,
      brightness: Brightness.light,
      onBackground: Colors.red,
      onError: Colors.red,
      onPrimary: lightSelectedItemColor,
      onSurface: Colors.red,
      onSecondary: lightOnBlockColor,
      primaryVariant: Colors.red,
      primary: buttonPrymaryColor,
      secondary: lightBlockColor,
      secondaryVariant: lightInputFillColor,
      surface: Colors.red,
    ),
  );
}
