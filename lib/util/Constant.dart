import 'package:flutter/material.dart';

class Constants{
  static String appName = "Flutter Travel";

  static List category = ["All","Historical Place","Landscape","Cultural","Mountains","Parks","Lakes","City"];

  //Color of a theme

  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.blueGrey.shade900;
  static Color darkAccent = Colors.white;
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  // light Theme

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      surface: lightBG,
      primary: lightPrimary,
    ),
    primaryColor: lightPrimary,
    // accentColor: lightAccent,
    // buttonColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      // textTheme: TextTheme(
        // headline6: TextStyle(
        //   color: darkBG,
        //   fontSize: 18.0,
        //   fontWeight: FontWeight.w800,
        // ),
      ),
    );

  // Dark Theme

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: darkBG,
      primary: darkPrimary,
    ),
    primaryColor: darkPrimary,
    // accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    // cursorColor: darkAccent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      // textTheme: TextTheme(
      //   headline6: TextStyle(
      //     color: lightBG,
      //     fontSize: 18.0,
      //     fontWeight: FontWeight.w800,
      //   ),
      ),
    );
}
