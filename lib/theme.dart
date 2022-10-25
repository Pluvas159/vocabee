import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppColors {
  static const secondary = Colors.deepOrangeAccent;
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF53585A);
  static const textLight = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF23212C);
  static const card = Color(0xFF985b10);
  static const appBar = Color(0xFFFCB43A);
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        colorScheme: const ColorScheme.light(),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: _LightColors.background,
          foregroundColor: AppColors.textDark,
        ),
        visualDensity: visualDensity,
        textTheme: const TextTheme().apply(bodyColor: AppColors.textDark),
        backgroundColor: _LightColors.background,
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        appBarTheme: const AppBarTheme(
          color: _DarkColors.appBar,
          foregroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        canvasColor: _DarkColors.background,
        primaryColor: _DarkColors.appBar,
        brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme: const TextTheme().apply(bodyColor: AppColors.textLight),
        backgroundColor: _DarkColors.background,
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLight),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: _DarkColors.appBar,
              foregroundColor: Colors.black),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: _DarkColors.appBar),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFaded),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _DarkColors.appBar),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      );
}
