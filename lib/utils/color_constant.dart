import 'package:flutter/material.dart';

/// Source: DESIGN.md > colors
class AppColors {

  // Core
  static const Color primary = Color(0xFF6F9367);
  static const Color primaryDim = Color(0xFF5A7A53); // hover state only, never standalone
  static const Color primarySurface = Color(0xFFF0F7EC); // tile hover bg / icon fill only, not text
  static const Color primaryTint = Color.fromRGBO(111, 147, 103, 0.1); // icon container fills only

  static const Color secondary = Color(0xFF575C67); // never a background
  static const Color secondaryTint = Color.fromRGBO(87, 92, 103, 0.06);

  static const Color surface = Color(0xFFF0EFEB); // page background
  static const Color surfaceCard = Color(0xFFFFFFFF); // card background only

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1B1C1A);
  static const Color onSurfaceMuted = Color(0xFF575C67);

  static const Color error = Color(0xFFBA1A1A); // errors + destructive actions only
  static const Color outline = Color(0xFF73796F);
  static const Color outlineVariant = Color(0xFFC3C8BD); // dashed dividers, subtle borders

  // Surface scale
  static const Color surfaceDim = Color(0xFFDADAD5);
  static const Color surfaceBright = Color(0xFFFAFAF4);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF4F4EE);
  static const Color surfaceContainer = Color(0xFFEEEEE8);
  static const Color surfaceContainerHigh = Color(0xFFE8E8E3);
  static const Color surfaceContainerHighest = Color(0xFFE2E3DD);
  static const Color onSurfaceVariant = Color(0xFF434840);
  static const Color surfaceVariant = Color(0xFFE2E3DD);

  static const Color inverseSurface = Color(0xFF2F312D);
  static const Color inverseOnSurface = Color(0xFFF1F1EB);
  static const Color surfaceTint = Color(0xFF45673F);

  // Material 3 scheme extras
  static const Color primaryContainer = Color(0xFF5A7D53);
  static const Color onPrimaryContainer = Color(0xFFF8FFF0);
  static const Color inversePrimary = Color(0xFFAAD1A0);

  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFDBDFED);
  static const Color onSecondaryContainer = Color(0xFF5E636E);

  static const Color tertiary = Color(0xFF804C61);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF9C647A);
  static const Color onTertiaryContainer = Color(0xFFFFFBFF);

  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  static const Color primaryFixed = Color(0xFFC6EDBB);
  static const Color primaryFixedDim = Color(0xFFAAD1A0);
  static const Color onPrimaryFixed = Color(0xFF022103);
  static const Color onPrimaryFixedVariant = Color(0xFF2E4E29);

  static const Color secondaryFixed = Color(0xFFDEE2EF);
  static const Color secondaryFixedDim = Color(0xFFC2C6D3);
  static const Color onSecondaryFixed = Color(0xFF171C25);
  static const Color onSecondaryFixedVariant = Color(0xFF424751);

  static const Color tertiaryFixed = Color(0xFFFFD9E5);
  static const Color tertiaryFixedDim = Color(0xFFF6B4CD);
  static const Color onTertiaryFixed = Color(0xFF350C20);
  static const Color onTertiaryFixedVariant = Color(0xFF68374C);

  static const Color background = Color(0xFFFAFAF4);
  static const Color onBackground = Color(0xFF1A1C19);

/// Usage rules from DESIGN.md:
/// - primary: headings, active nav, primary buttons, ticket numbers, section titles, logo.
/// - error: live queue pulse dot, destructive actions, validation only. Never decorative.
/// - surface vs surfaceCard: page body is `surface`, all cards are `surfaceCard`. Never invert.
}