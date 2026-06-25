import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

// ============================================================
//  ShipX Design System - Dark Theme (Minimal Implementation)
// ============================================================

ThemeData darkThemeData() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      surface: const Color(0xFF0F172A),
      onSurface: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bg1,
      foregroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: AppTextStyles.heading6,
    ),

    extensions: const [AppColorScheme.dark],
  );
}
