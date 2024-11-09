import 'package:flutter/material.dart';

final theme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Color.fromRGBO(56, 215, 75, 1)),
    primaryColor: const Color.fromRGBO(56, 215, 75, 1),
    hoverColor: const Color.fromRGBO(10, 255, 20, 1),
    canvasColor: const Color.fromRGBO(9, 21, 48, 1),
    primaryColorDark: const Color.fromRGBO(3, 16, 28, 1),
    cardColor: const Color.fromRGBO(28, 51, 105, 1),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          fontFamily: "Inconsolata", fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(56, 215, 75, 1)),
      bodyMedium: TextStyle(
          fontFamily: "Inconsolata", fontSize: 20, fontWeight: FontWeight.w400, color: Color.fromRGBO(56, 215, 75, 1)),
      bodyLarge: TextStyle(
          fontFamily: "Inconsolata", fontSize: 25, fontWeight: FontWeight.w400, color: Color.fromRGBO(56, 215, 75, 1)),
      labelSmall: TextStyle(
          fontFamily: "Inconsolata", fontSize: 16, fontWeight: FontWeight.w600, color: Color.fromRGBO(56, 215, 75, 1)),
      labelMedium: TextStyle(
          fontFamily: "Inconsolata", fontSize: 20, fontWeight: FontWeight.w600, color: Color.fromRGBO(56, 215, 75, 1)),
      labelLarge: TextStyle(
          fontFamily: "Inconsolata", fontSize: 25, fontWeight: FontWeight.w600, color: Color.fromRGBO(56, 215, 75, 1)),
      titleSmall: TextStyle(
          fontFamily: "Inconsolata", fontSize: 16, fontWeight: FontWeight.w200, color: Color.fromRGBO(56, 215, 75, 1)),
      titleMedium: TextStyle(
          fontFamily: "Inconsolata", fontSize: 20, fontWeight: FontWeight.w200, color: Color.fromRGBO(56, 215, 75, 1)),
      titleLarge: TextStyle(
          fontFamily: "Inconsolata", fontSize: 25, fontWeight: FontWeight.w200, color: Color.fromRGBO(56, 215, 75, 1)),
    ));
