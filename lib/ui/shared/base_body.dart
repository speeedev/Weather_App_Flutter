import 'package:flutter/material.dart';
import 'package:weather/core/extension/color_extension.dart';
import 'package:weather/core/extension/context_extension.dart';

class BaseBody extends StatelessWidget {
  final Widget? child;
  final bool? isLoading;
  final bool? gradientBackground;
  final EdgeInsets padding;
  const BaseBody({
    super.key,
    this.child,
    this.padding = const EdgeInsets.all(0),
    this.isLoading = false,
    this.gradientBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading!
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            width: context.width,
            height: context.height,
            padding: padding,
            decoration: gradientBackground!
                ? BoxDecoration(
                    gradient: context.colors.scaffoldBackground,
                  )
                : null,
            child: child,
          );
  }
}
