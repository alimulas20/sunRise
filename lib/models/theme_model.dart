import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/config.dart';

class ThemeModel {
  final lightMode = ThemeData(
    primaryColor: Config().appColor,
    iconTheme: IconThemeData(color: Colors.grey[900]),
    fontFamily: 'Rubik',
    colorScheme: ColorScheme.light(
      primary: Config().appColor,
      secondary: const Color(0xFFFAB74A),
    ),
    scaffoldBackgroundColor: Config().appColor,
    brightness: Brightness.light,
    primaryColorDark: Colors.grey[800],
    primaryColorLight: Colors.white,
    secondaryHeaderColor: Colors.grey[600],
    shadowColor: Colors.grey[200],
    backgroundColor: const Color(0xFFEFEEFC),
    dialogBackgroundColor: Colors.white,
    primaryIconTheme: IconThemeData(color: Config().appColor),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: Config().appColor,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.grey[900],
      ),
      actionsIconTheme: IconThemeData(color: Colors.grey[900]),
      titleTextStyle: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.6,
        wordSpacing: 1,
        color: Colors.grey[900],
      ),
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.grey[900],
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Config().appColor,
      unselectedItemColor: Colors.grey[500],
    ),
  );

  // final darkMode = ThemeData(
  //     primaryColor: Config().appColor,
  //     //accentColor: Colors.white,
  //     iconTheme: IconThemeData(color: Colors.white),
  //     fontFamily: 'Manrope',
  //     colorScheme: ColorScheme.dark(
  //       primary: Config().appColor,
  //       secondary: Color(0xFFFAB74A),
  //     ),
  //     scaffoldBackgroundColor: Color(0xff303030),
  //     brightness: Brightness.dark,
  //     primaryColorDark: Colors.grey[300],
  //     primaryColorLight: Colors.grey[800],
  //     secondaryHeaderColor: Colors.grey[400],
  //     shadowColor: Color(0xff282828),
  //     backgroundColor: Colors.grey[900],
  //     appBarTheme: AppBarTheme(
  //       systemOverlayStyle: SystemUiOverlayStyle.light,
  //       color: Colors.grey[900],
  //       elevation: 0,
  //       iconTheme: IconThemeData(
  //         color: Colors.white,
  //       ),
  //       actionsIconTheme: IconThemeData(color: Colors.white),
  //       titleTextStyle: TextStyle(
  //         fontFamily: 'Manrope',
  //         fontSize: 18,
  //         letterSpacing: -0.6,
  //         wordSpacing: 1,
  //         fontWeight: FontWeight.w700,
  //         color: Colors.white,
  //       ),
  //     ),
  //     inputDecorationTheme: InputDecorationTheme(
  //       iconColor: Config().appColor,
  //     ),
  //     textTheme: TextTheme(
  //       subtitle1: TextStyle(
  //           fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
  //     ),
  //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //       backgroundColor: Colors.grey[900],
  //       selectedItemColor: Colors.white,
  //       unselectedItemColor: Colors.grey[500],
  //     ));

  final darkMode = ThemeData(
      primaryColor: Config().appColor,
      //accentColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      fontFamily: 'Manrope',
      scaffoldBackgroundColor: const Color(0xff303030),
      brightness: Brightness.dark,
      primaryColorDark: Colors.grey[300],
      primaryColorLight: Colors.grey[800],
      secondaryHeaderColor: Colors.grey[400],
      shadowColor: const Color(0xff282828),
      backgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        color: Colors.grey[900],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          fontFamily: 'Manrope',
          fontSize: 18,
          letterSpacing: -0.6,
          wordSpacing: 1,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
      ));
}
