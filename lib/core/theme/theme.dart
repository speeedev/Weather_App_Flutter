import 'package:flutter/material.dart';
import 'package:weather/core/constants/color_constants.dart';
import 'package:weather/core/extension/color_extension.dart';
import 'package:weather/core/extension/context_extension.dart';

ThemeData buildThemeData(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: context.colors.myPrimary,
      secondary: context.colors.mySecondary,
      tertiary: context.colors.myTertiary,
      onPrimary: context.colors.myTertiary,
    ),
    textTheme: Theme.of(context).textTheme.copyWith().apply(
          fontFamily: "Vazir",
          bodyColor: ColorConstants.white,
          displayColor: ColorConstants.white,
        ),
    iconTheme: const IconThemeData(color: ColorConstants.white),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(ColorConstants.white),
        overlayColor: MaterialStateProperty.all<Color>(
            context.colors.myTertiary.withOpacity(0.5)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorConstants.white),
      titleTextStyle: TextStyle(
        fontSize: 22,
        color: ColorConstants.white,
        fontFamily: "Vazir",
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: context.colors.myTertiary,
      iconColor: ColorConstants.white,
      prefixIconColor: ColorConstants.white,
      suffixIconColor: ColorConstants.white,
      hintStyle: TextStyle(
        color: ColorConstants.white.withOpacity(0.9),
        fontWeight: FontWeight.w300,
      ),
      labelStyle: const TextStyle(
        color: ColorConstants.white,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorConstants.white,
      selectionColor: context.colors.myTertiary.withOpacity(0.5),
      selectionHandleColor: context.colors.myTertiary,
    ),
    cardTheme: CardTheme(
      color: context.colors.myTertiary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
      textColor: ColorConstants.white,
      iconColor: ColorConstants.white,
    ),
  );
}
