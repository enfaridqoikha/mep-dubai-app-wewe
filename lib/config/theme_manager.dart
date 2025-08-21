import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData light() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: const Color(0xFF0E5AD4),
    scaffoldBackgroundColor: const Color(0xFFF7F9FC),
    cardTheme: const CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
    ),
    appBarTheme: const AppBarTheme(centerTitle: true),
  );

  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color(0xFF0E5AD4),
    cardTheme: const CardTheme(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
    ),
  );
}
