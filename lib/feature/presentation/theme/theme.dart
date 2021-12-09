import 'package:flutter/material.dart';

import 'constant.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: lightSelectedItemColor,
      unselectedItemColor: lightUnSelectedItemColor,
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(fontSize: 20, color: lightSelectedItemColor)),
  );
}
