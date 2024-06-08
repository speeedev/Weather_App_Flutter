import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/core/constants/color_constants.dart';
import 'package:weather/core/extension/context_extension.dart';
import 'package:weather/ui/shared/widget/ellipsis_text.dart';

class WeatherListViewContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool subTitleOpacityLow;
  final String trailingText;
  final bool isSelected;
  const WeatherListViewContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.trailingText,
    this.subTitleOpacityLow = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isSelected == false
            ? context.colors.tertiary
            : ColorConstants.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EllipsisText(
                  title,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: isSelected == false
                        ? ColorConstants.white
                        : context.colors.tertiary,
                  ),
                  maxLines: 1,
                ),
                EllipsisText(
                  subTitle,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: isSelected == false
                        ? ColorConstants.white
                            .withOpacity(subTitleOpacityLow == true ? 0.7 : 1.0)
                        : context.colors.tertiary.withOpacity(
                            subTitleOpacityLow == true ? 0.7 : 1.0),
                  ),
                ),
              ],
            ),
          ),
          Text(
            trailingText,
            style: context.textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: isSelected == false
                  ? ColorConstants.white
                  : context.colors.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
