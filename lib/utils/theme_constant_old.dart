import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3d6838),
      surfaceTint: Color(0xff3d6838),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbef0b2),
      onPrimaryContainer: Color(0xff265022),
      secondary: Color(0xff3f5f90),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd6e3ff),
      onSecondaryContainer: Color(0xff254777),
      tertiary: Color(0xff8a4a65),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd9e5),
      onTertiaryContainer: Color(0xff6e334d),
      error: Color(0xff904a43),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff73342d),
      surface: Color(0xfff7fbf1),
      onSurface: Color(0xff191d17),
      onSurfaceVariant: Color(0xff424940),
      outline: Color(0xff72796f),
      outlineVariant: Color(0xffc2c9bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322b),
      inversePrimary: Color(0xffa3d398),
      primaryFixed: Color(0xffbef0b2),
      onPrimaryFixed: Color(0xff002202),
      primaryFixedDim: Color(0xffa3d398),
      onPrimaryFixedVariant: Color(0xff265022),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff001b3c),
      secondaryFixedDim: Color(0xffa8c8ff),
      onSecondaryFixedVariant: Color(0xff254777),
      tertiaryFixed: Color(0xffffd9e5),
      onTertiaryFixed: Color(0xff390721),
      tertiaryFixedDim: Color(0xffffb0ce),
      onTertiaryFixedVariant: Color(0xff6e334d),
      surfaceDim: Color(0xffd8dbd2),
      surfaceBright: Color(0xfff7fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5eb),
      surfaceContainer: Color(0xffecefe6),
      surfaceContainerHigh: Color(0xffe6e9e0),
      surfaceContainerHighest: Color(0xffe0e4da),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff143e13),
      surfaceTint: Color(0xff3d6838),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4c7745),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff103665),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4e6ea0),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5a233c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9b5874),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e231e),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa25850),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7fbf1),
      onSurface: Color(0xff0e120d),
      onSurfaceVariant: Color(0xff313830),
      outline: Color(0xff4e544b),
      outlineVariant: Color(0xff686f65),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322b),
      inversePrimary: Color(0xffa3d398),
      primaryFixed: Color(0xff4c7745),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff345e2f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4e6ea0),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff355586),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9b5874),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7f415b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4c8bf),
      surfaceBright: Color(0xfff7fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5eb),
      surfaceContainer: Color(0xffe6e9e0),
      surfaceContainerHigh: Color(0xffdbded5),
      surfaceContainerHighest: Color(0xffcfd3ca),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff083409),
      surfaceTint: Color(0xff3d6838),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff285224),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002c5a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff284979),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4e1832),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff713550),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511a15),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff76362f),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7fbf1),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff272e26),
      outlineVariant: Color(0xff444b42),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322b),
      inversePrimary: Color(0xffa3d398),
      primaryFixed: Color(0xff285224),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff103b10),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff284979),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0a3261),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff713550),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff561f39),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb6bab1),
      surfaceBright: Color(0xfff7fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff2e8),
      surfaceContainer: Color(0xffe0e4da),
      surfaceContainerHigh: Color(0xffd2d6cc),
      surfaceContainerHighest: Color(0xffc4c8bf),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa3d398),
      surfaceTint: Color(0xffa3d398),
      onPrimary: Color(0xff0e380d),
      primaryContainer: Color(0xff265022),
      onPrimaryContainer: Color(0xffbef0b2),
      secondary: Color(0xffa8c8ff),
      onSecondary: Color(0xff06305f),
      secondaryContainer: Color(0xff254777),
      onSecondaryContainer: Color(0xffd6e3ff),
      tertiary: Color(0xffffb0ce),
      onTertiary: Color(0xff531d36),
      tertiaryContainer: Color(0xff6e334d),
      onTertiaryContainer: Color(0xffffd9e5),
      error: Color(0xffffb4ab),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73342d),
      onErrorContainer: Color(0xffffdad5),
      surface: Color(0xff11140f),
      onSurface: Color(0xffe0e4da),
      onSurfaceVariant: Color(0xffc2c9bd),
      outline: Color(0xff8c9388),
      outlineVariant: Color(0xff424940),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4da),
      inversePrimary: Color(0xff3d6838),
      primaryFixed: Color(0xffbef0b2),
      onPrimaryFixed: Color(0xff002202),
      primaryFixedDim: Color(0xffa3d398),
      onPrimaryFixedVariant: Color(0xff265022),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff001b3c),
      secondaryFixedDim: Color(0xffa8c8ff),
      onSecondaryFixedVariant: Color(0xff254777),
      tertiaryFixed: Color(0xffffd9e5),
      onTertiaryFixed: Color(0xff390721),
      tertiaryFixedDim: Color(0xffffb0ce),
      onTertiaryFixedVariant: Color(0xff6e334d),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff363a34),
      surfaceContainerLowest: Color(0xff0b0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff323630),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb8e9ac),
      surfaceTint: Color(0xffa3d398),
      onPrimary: Color(0xff012d04),
      primaryContainer: Color(0xff6e9c66),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffccddff),
      onSecondary: Color(0xff00254e),
      secondaryContainer: Color(0xff7292c6),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd0e0),
      onTertiary: Color(0xff46122b),
      tertiaryContainer: Color(0xffc47b98),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff48130f),
      errorContainer: Color(0xffcc7b72),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff11140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd8ded2),
      outline: Color(0xffadb4a9),
      outlineVariant: Color(0xff8c9288),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4da),
      inversePrimary: Color(0xff275123),
      primaryFixed: Color(0xffbef0b2),
      onPrimaryFixed: Color(0xff001601),
      primaryFixedDim: Color(0xffa3d398),
      onPrimaryFixedVariant: Color(0xff143e13),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff00112a),
      secondaryFixedDim: Color(0xffa8c8ff),
      onSecondaryFixedVariant: Color(0xff103665),
      tertiaryFixed: Color(0xffffd9e5),
      onTertiaryFixed: Color(0xff2b0016),
      tertiaryFixedDim: Color(0xffffb0ce),
      onTertiaryFixedVariant: Color(0xff5a233c),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff42463f),
      surfaceContainerLowest: Color(0xff050805),
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
      primary: Color(0xffcbfdbf),
      surfaceTint: Color(0xffa3d398),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9fcf94),
      onPrimaryContainer: Color(0xff000f01),
      secondary: Color(0xffebf0ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffa4c4fb),
      onSecondaryContainer: Color(0xff000b1f),
      tertiary: Color(0xffffebf0),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfffcacca),
      onTertiaryContainer: Color(0xff20000f),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff11140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffecf2e6),
      outlineVariant: Color(0xffbec5b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4da),
      inversePrimary: Color(0xff275123),
      primaryFixed: Color(0xffbef0b2),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa3d398),
      onPrimaryFixedVariant: Color(0xff001601),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffa8c8ff),
      onSecondaryFixedVariant: Color(0xff00112a),
      tertiaryFixed: Color(0xffffd9e5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb0ce),
      onTertiaryFixedVariant: Color(0xff2b0016),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff4d514a),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d211b),
      surfaceContainer: Color(0xff2d322b),
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
