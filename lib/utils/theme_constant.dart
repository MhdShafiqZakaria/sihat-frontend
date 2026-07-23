import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff436833),
      surfaceTint: Color(0xff436833),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc3efac),
      onPrimaryContainer: Color(0xff2c4f1e),
      secondary: Color(0xff4e6629),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd0eda1),
      onSecondaryContainer: Color(0xff374d13),
      tertiary: Color(0xff586420),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdcea97),
      onTertiaryContainer: Color(0xff414b08),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff191d17),
      onSurfaceVariant: Color(0xff43483f),
      outline: Color(0xff73796e),
      outlineVariant: Color(0xffc3c8bb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e312b),
      inversePrimary: Color(0xffa8d292),
      primaryFixed: Color(0xffc3efac),
      onPrimaryFixed: Color(0xff052100),
      primaryFixedDim: Color(0xffa8d292),
      onPrimaryFixedVariant: Color(0xff2c4f1e),
      secondaryFixed: Color(0xffd0eda1),
      onSecondaryFixed: Color(0xff121f00),
      secondaryFixedDim: Color(0xffb4d087),
      onSecondaryFixedVariant: Color(0xff374d13),
      tertiaryFixed: Color(0xffdcea97),
      onTertiaryFixed: Color(0xff181e00),
      tertiaryFixedDim: Color(0xffc0ce7e),
      onTertiaryFixedVariant: Color(0xff414b08),
      surfaceDim: Color(0xffd8dbd1),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5ea),
      surfaceContainer: Color(0xffecefe5),
      surfaceContainerHigh: Color(0xffe7e9df),
      surfaceContainerHighest: Color(0xffe1e4da),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1b3e0e),
      surfaceTint: Color(0xff436833),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff517740),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff273c03),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5c7537),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff313a00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff67732e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff0f120d),
      onSurfaceVariant: Color(0xff32382e),
      outline: Color(0xff4f544a),
      outlineVariant: Color(0xff696f64),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e312b),
      inversePrimary: Color(0xffa8d292),
      primaryFixed: Color(0xff517740),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff395e2a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5c7537),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff455c21),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff67732e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4f5a17),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5c8be),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5ea),
      surfaceContainer: Color(0xffe7e9df),
      surfaceContainerHigh: Color(0xffdbded4),
      surfaceContainerHighest: Color(0xffd0d3c9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff113305),
      surfaceTint: Color(0xff436833),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2e5220),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1e3100),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff395016),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff283000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff434e0b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff282e25),
      outlineVariant: Color(0xff454b41),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e312b),
      inversePrimary: Color(0xffa8d292),
      primaryFixed: Color(0xff2e5220),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff183a0b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff395016),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff243901),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff434e0b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2e3600),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb7bab0),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff2e8),
      surfaceContainer: Color(0xffe1e4da),
      surfaceContainerHigh: Color(0xffd3d6cc),
      surfaceContainerHighest: Color(0xffc5c8be),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa8d292),
      surfaceTint: Color(0xffa8d292),
      onPrimary: Color(0xff153808),
      primaryContainer: Color(0xff2c4f1e),
      onPrimaryContainer: Color(0xffc3efac),
      secondary: Color(0xffb4d087),
      onSecondary: Color(0xff223600),
      secondaryContainer: Color(0xff374d13),
      onSecondaryContainer: Color(0xffd0eda1),
      tertiary: Color(0xffc0ce7e),
      onTertiary: Color(0xff2c3400),
      tertiaryContainer: Color(0xff414b08),
      onTertiaryContainer: Color(0xffdcea97),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff11140f),
      onSurface: Color(0xffe1e4da),
      onSurfaceVariant: Color(0xffc3c8bb),
      outline: Color(0xff8d9387),
      outlineVariant: Color(0xff43483f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inversePrimary: Color(0xff436833),
      primaryFixed: Color(0xffc3efac),
      onPrimaryFixed: Color(0xff052100),
      primaryFixedDim: Color(0xffa8d292),
      onPrimaryFixedVariant: Color(0xff2c4f1e),
      secondaryFixed: Color(0xffd0eda1),
      onSecondaryFixed: Color(0xff121f00),
      secondaryFixedDim: Color(0xffb4d087),
      onSecondaryFixedVariant: Color(0xff374d13),
      tertiaryFixed: Color(0xffdcea97),
      onTertiaryFixed: Color(0xff181e00),
      tertiaryFixedDim: Color(0xffc0ce7e),
      onTertiaryFixedVariant: Color(0xff414b08),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff373a33),
      surfaceContainerLowest: Color(0xff0c0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211a),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff32362f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbde9a7),
      surfaceTint: Color(0xffa8d292),
      onPrimary: Color(0xff092c01),
      primaryContainer: Color(0xff749b61),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcae69b),
      onSecondary: Color(0xff192a00),
      secondaryContainer: Color(0xff7f9957),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffd6e491),
      onTertiary: Color(0xff222900),
      tertiaryContainer: Color(0xff8a974e),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff11140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd9ded1),
      outline: Color(0xffaeb4a7),
      outlineVariant: Color(0xff8d9286),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inversePrimary: Color(0xff2d501f),
      primaryFixed: Color(0xffc3efac),
      onPrimaryFixed: Color(0xff021500),
      primaryFixedDim: Color(0xffa8d292),
      onPrimaryFixedVariant: Color(0xff1b3e0e),
      secondaryFixed: Color(0xffd0eda1),
      onSecondaryFixed: Color(0xff0a1400),
      secondaryFixedDim: Color(0xffb4d087),
      onSecondaryFixedVariant: Color(0xff273c03),
      tertiaryFixed: Color(0xffdcea97),
      onTertiaryFixed: Color(0xff0f1300),
      tertiaryFixedDim: Color(0xffc0ce7e),
      onTertiaryFixedVariant: Color(0xff313a00),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff42463e),
      surfaceContainerLowest: Color(0xff050804),
      surfaceContainerLow: Color(0xff1b1f19),
      surfaceContainer: Color(0xff252923),
      surfaceContainerHigh: Color(0xff30342d),
      surfaceContainerHighest: Color(0xff3b3f38),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd1fdb9),
      surfaceTint: Color(0xffa8d292),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa4ce8f),
      onPrimaryContainer: Color(0xff010f00),
      secondary: Color(0xffddfaad),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb0cc84),
      onSecondaryContainer: Color(0xff060e00),
      tertiary: Color(0xffeaf8a3),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffbcca7a),
      onTertiaryContainer: Color(0xff090d00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff11140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffedf2e4),
      outlineVariant: Color(0xffbfc4b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inversePrimary: Color(0xff2d501f),
      primaryFixed: Color(0xffc3efac),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa8d292),
      onPrimaryFixedVariant: Color(0xff021500),
      secondaryFixed: Color(0xffd0eda1),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb4d087),
      onSecondaryFixedVariant: Color(0xff0a1400),
      tertiaryFixed: Color(0xffdcea97),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc0ce7e),
      onTertiaryFixedVariant: Color(0xff0f1300),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff4e514a),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d211a),
      surfaceContainer: Color(0xff2e312b),
      surfaceContainerHigh: Color(0xff393d36),
      surfaceContainerHighest: Color(0xff444841),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
