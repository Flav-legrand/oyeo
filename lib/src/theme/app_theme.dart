import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFF8A00);
  static const Color secondary = Color(0xFF1E88E5);
  static const Color background = Color(0xFFFFFFFF); // Blanc
  static const Color surface = Color(0xFFF5F5F5); // Gris très clair
  static const Color darkText = Color(0xFF1A1A1A); // Texte sombre
  static const Color lightGray = Color(0xFFE5E5E5); // Gris pour les bordures

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: secondary,
      surface: surface,
    ),
    scaffoldBackgroundColor: background,
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      foregroundColor: darkText,
      elevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 1,
      color: surface,
    ),
    textTheme: Typography.blackMountainView.apply(fontFamily: 'Roboto'),
  );
}
