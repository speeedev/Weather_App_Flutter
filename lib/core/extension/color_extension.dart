import 'package:flutter/material.dart';
import 'package:weather/core/constants/color_constants.dart';


extension MyColor on ColorScheme {
  Color get selectedColor => ColorConstants.white;
  LinearGradient get scaffoldBackground => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [ColorConstants.blue2, ColorConstants.blue3],
      );

  Color get myPrimary => ColorConstants.blue3;
  Color get mySecondary => ColorConstants.blue3;
  Color get myTertiary => ColorConstants.blue;
}