import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

// ============================================================
//  ShipX Design System - Light Theme
// ============================================================

ThemeData lightThemeData() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.title,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.bg2,
      onSecondaryContainer: AppColors.title,
      error: AppColors.red,
      onError: AppColors.white,
      errorContainer: Color(0xFFFFEDED),
      onErrorContainer: Color(0xFF7F1D1D),
      surface: AppColors.bg1,
      onSurface: AppColors.title,
      surfaceContainerHighest: AppColors.bg2,
      onSurfaceVariant: AppColors.body,
      outline: AppColors.border,
      outlineVariant: Color(0xFFF1F5F9),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: AppColors.title,
      onInverseSurface: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.background,
    dividerColor: AppColors.border,
    dividerTheme: const DividerThemeData(
      color: AppColors.border,
      thickness: 1,
      space: 1,
    ),

    // ── AppBar ──────────────────────────
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.title,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTextStyles.heading6,
      centerTitle: false,
    ),

    // ── Card ────────────────────────────
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: ShipXRadius.lgAll,
        side: const BorderSide(color: AppColors.border),
      ),
      margin: EdgeInsets.zero,
    ),

    // ── ElevatedButton ──────────────────
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        textStyle: AppTextStyles.body5,
        padding: const EdgeInsets.symmetric(
          horizontal: ShipXSpacing.buttonPaddingH,
          vertical: ShipXSpacing.buttonPaddingV,
        ),
        shape: RoundedRectangleBorder(borderRadius: ShipXRadius.smAll),
      ),
    ),

    // ── OutlinedButton ──────────────────
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        textStyle: AppTextStyles.body5,
        padding: const EdgeInsets.symmetric(
          horizontal: ShipXSpacing.buttonPaddingH,
          vertical: ShipXSpacing.buttonPaddingV,
        ),
        shape: RoundedRectangleBorder(borderRadius: ShipXRadius.smAll),
      ),
    ),

    // ── TextButton ──────────────────────
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.body5,
        padding: const EdgeInsets.symmetric(
          horizontal: ShipXSpacing.sm,
          vertical: ShipXSpacing.xs,
        ),
      ),
    ),

    // ── InputDecoration ─────────────────
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: ShipXSpacing.base,
        vertical: ShipXSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: ShipXRadius.smAll,
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: ShipXRadius.smAll,
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: ShipXRadius.smAll,
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: ShipXRadius.smAll,
        borderSide: const BorderSide(color: AppColors.red),
      ),
      hintStyle: AppTextStyles.body3.copyWith(color: const Color(0xFFCBD5E1)),
      labelStyle: AppTextStyles.body6,
      errorStyle: AppTextStyles.small1.copyWith(color: AppColors.red),
    ),

    // ── Chip ─────────────────────────────
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.bg2,
      labelStyle: AppTextStyles.body6,
      side: const BorderSide(color: AppColors.border),
      shape: RoundedRectangleBorder(borderRadius: ShipXRadius.fullAll),
      padding: const EdgeInsets.symmetric(
        horizontal: ShipXSpacing.sm,
        vertical: ShipXSpacing.xs2,
      ),
    ),

    // ── BottomNavigationBar ──────────────
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.body,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
    ),

    // ── ListTile ─────────────────────────
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(
        horizontal: ShipXSpacing.base,
        vertical: ShipXSpacing.xs,
      ),
      iconColor: AppColors.body,
      textColor: AppColors.title,
    ),

    // ── SnackBar ─────────────────────────
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.title,
      contentTextStyle: AppTextStyles.body4.copyWith(
        color: AppColors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: ShipXRadius.smAll),
      behavior: SnackBarBehavior.floating,
    ),

    // ── Dialog ───────────────────────────
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: ShipXRadius.xlAll),
      titleTextStyle: AppTextStyles.heading6,
      contentTextStyle: AppTextStyles.body3,
    ),

    extensions: const [AppColorScheme.light],
  );
}
