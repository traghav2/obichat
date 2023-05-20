import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const secondary = Colors.green;
  static const accent = Color(0xFFFF7C50);
  static const textDark = Color(0xFF53585A);
  static const textLight = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Colors.black;
}

abstract class _LightColors {
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    primaryColor: accentColor,
    visualDensity: visualDensity,
    textTheme: GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
    colorScheme: const ColorScheme.light().copyWith(
      background: _LightColors.card,
    ),
    scaffoldBackgroundColor: _LightColors.card,
    primaryTextTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.textDark),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconDark),
  );

  /// Dark theme and its settings.
  static ThemeData dark(ThemeData theme) => ThemeData(
    brightness: Brightness.dark,
    primaryColor: accentColor,
    visualDensity: visualDensity,
    textTheme: GoogleFonts.interTextTheme(theme.textTheme).apply(bodyColor: AppColors.textLight),
    colorScheme: const ColorScheme.dark().copyWith(
      background: _DarkColors.card,
    ),
    scaffoldBackgroundColor: _DarkColors.card,
    primaryTextTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.textLight),
    ),
  );
}
