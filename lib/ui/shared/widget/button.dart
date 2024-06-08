import 'package:flutter/material.dart';
import 'package:weather/core/constants/color_constants.dart';
import 'package:weather/core/extension/context_extension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? color;
  final double? height;
  final double? width;
  final double borderRadius;
  final bool isBold;
  final bool isElevation;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.height,
    this.width,
    this.borderRadius = 26,
    this.isBold = false,
    this.isElevation = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultHeight = context.mediumValue;

    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? context.colors.tertiary,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(width ?? double.infinity, height ?? defaultHeight),
        ),
        elevation: isElevation
            ? MaterialStateProperty.all<double>(4)
            : MaterialStateProperty.all<double>(0),
        shadowColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      child: Text(
        text,
        style: context.textTheme.bodyLarge!.copyWith(
          color: ColorConstants.white,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
