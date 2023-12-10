import 'package:flutter/material.dart';

class Pallete {
  static const primaryColor = Colors.white;
  static const secondaryColor = Color.fromRGBO(230, 116, 12, 1);
  static const thirdColor = Color.fromRGBO(236, 236, 236, 1.0);
  static const thirdColorMob = Color.fromRGBO(241, 241, 241, 1.0);
  static const blackColor = Colors.black;
  static const containerColor = Color(0xFFD0D0D0);
  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: primaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
    ),
    cardColor: secondaryColor,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(secondaryColor),
        iconColor: MaterialStatePropertyAll(secondaryColor),
        textStyle: MaterialStatePropertyAll(
          TextStyle(color: primaryColor),
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: blackColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: secondaryColor,
      unselectedIconTheme: IconThemeData(color: secondaryColor),
      unselectedLabelStyle: TextStyle(color: secondaryColor),
    ),
  );
}
