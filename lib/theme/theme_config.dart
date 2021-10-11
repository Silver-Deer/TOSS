import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Color(0xff1f1f1f);
  static Color lightAccent = Color(0xff2ca8e2);
  static Color darkAccent = Color(0xff2ca8e2);
  static Color lightBG = Colors.white;
  static Color darkBG = Color(0xff343959);

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'NanumGothic',
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    cardColor: Colors.white70,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      headline4: TextStyle(
          color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
      headline5: TextStyle(
          color: Colors.black38, fontSize: 15, fontWeight: FontWeight.bold),
      headline6: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
      bodyText2: TextStyle(
          color: Colors.black, fontSize: 13, fontWeight: FontWeight.normal),
      subtitle1: TextStyle(
          color: Colors.black54, fontSize: 11, fontWeight: FontWeight.normal),
      subtitle2: TextStyle(
          color: Colors.black45, fontSize: 11, fontWeight: FontWeight.normal),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'NanumGothic',
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cardColor: Colors.black87,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      headline4: TextStyle(
          color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
      headline5: TextStyle(
          color: Colors.black38, fontSize: 15, fontWeight: FontWeight.bold),
      headline6: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
      bodyText2: TextStyle(
          color: Colors.white, fontSize: 13, fontWeight: FontWeight.normal),
      subtitle1: TextStyle(
          color: Colors.grey[800], fontSize: 11, fontWeight: FontWeight.w300),
      subtitle2: TextStyle(
          color: Colors.grey[600], fontSize: 11, fontWeight: FontWeight.w300),
    ),
  );
}
