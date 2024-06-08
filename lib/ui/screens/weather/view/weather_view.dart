import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/base/view/base_widget.dart';
import 'package:weather/core/constants/color_constants.dart';
import 'package:weather/core/constants/path_constants.dart';
import 'package:weather/core/extension/context_extension.dart';
import 'package:weather/ui/screens/weather/view_model/weather_view_model.dart';
import 'package:weather/ui/shared/base_body.dart';
import 'package:weather/ui/shared/widget/ellipsis_text.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BaseView<WeatherViewModel>(
      viewModel: WeatherViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, model, child) => Scaffold(
        body: BaseBody(
          gradientBackground: true,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: kToolbarHeight),
                _BuildHeader(model: model),
                _BuildDateEllipsisText(model: model),
                SizedBox(height: context.veryLowValue),
                SizedBox(height: context.mediumValue),
                const _BuildWeatherImage(),
                SizedBox(height: context.lowValue),
                _BuildTemperatureEllipsisText(model: model),
                _BuildFeltTemperatureEllipsisText(model: model),
                SizedBox(height: context.mediumValue),
                _BuildWeatherDetails(model: model),
                SizedBox(height: context.mediumValue),
                _BuildWeatherByHourTitle(model: model),
                SizedBox(height: context.veryLowValue),
                _BuildWeatherByHour(model: model),
                SizedBox(height: context.highValue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildWeatherByHour extends StatelessWidget {
  WeatherViewModel model;
  _BuildWeatherByHour({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: context.height * 0.10,
        maxHeight: context.height * 0.12,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding:
            context.paddingMediumHorizontal - const EdgeInsets.only(left: 8),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color:
                  index == 1 ? ColorConstants.white : context.colors.tertiary,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EllipsisText(
                  model.weatherData.todayForecast[index].time,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: index == 1
                        ? context.colors.secondary
                        : ColorConstants.white,
                  ),
                ),
                const SizedBox(height: 4),
                Icon(
                  WeatherIcons.rain,
                  color:
                      index == 1 ? ColorConstants.blue3 : ColorConstants.white,
                ),
                SizedBox(height: context.lowValue),
                EllipsisText(
                  "${model.weatherData.todayForecast[index].temperature}°C",
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: index == 1
                        ? context.colors.secondary
                        : ColorConstants.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BuildWeatherByHourTitle extends StatelessWidget {
  WeatherViewModel model;
  _BuildWeatherByHourTitle({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EllipsisText(
            "Today",
            style: context.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  model.navigateToNext7Days();
                },
                child: Row(
                  children: [
                    EllipsisText(
                      "Next 7 days",
                      style: context.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: context.lowValue),
                    const Icon(Icons.arrow_forward_ios, size: 14),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildWeatherDetails extends StatelessWidget {
  WeatherViewModel model;
  _BuildWeatherDetails({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHighHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(WeatherIcons.rain),
                  const SizedBox(width: 6),
                  EllipsisText(
                    "${model.weatherData.chanceOfRain}%",
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: context.lowValue),
              EllipsisText(
                "Chance of rains",
                style: context.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.energy_savings_leaf_outlined),
                  const SizedBox(width: 6),
                  EllipsisText(
                    model.weatherData.airQualityIndex.toString(),
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: context.lowValue),
              EllipsisText(
                "Air quality index",
                style: context.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.water_drop_outlined),
                  const SizedBox(width: 6),
                  EllipsisText(
                    "${model.weatherData.humidity}%",
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: context.lowValue),
              EllipsisText(
                "Humidity",
                style: context.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildFeltTemperatureEllipsisText extends StatelessWidget {
  WeatherViewModel model;
  _BuildFeltTemperatureEllipsisText({required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: context.colors.tertiary,
          ),
          child: EllipsisText(
            model.weatherData.currentWeatherDescription,
            style: context.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        const SizedBox(width: 8),
        EllipsisText(
          "Feels like ${model.weatherData.feelsLikeTemperature}°C",
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}

class _BuildTemperatureEllipsisText extends StatelessWidget {
  WeatherViewModel model;
  _BuildTemperatureEllipsisText({required this.model});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorConstants.white,
            Colors.transparent,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: EllipsisText(
        "${model.weatherData.currentTemperature}°C",
        style: context.textTheme.displayLarge!.copyWith(
          fontSize: MediaQuery.of(context).size.width / 3,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}

class _BuildWeatherImage extends StatelessWidget {
  const _BuildWeatherImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      PathConstants.cloudRainGif,
      height: context.height * 0.25,
    );
  }
}

class _BuildDateEllipsisText extends StatelessWidget {
  WeatherViewModel model;
  _BuildDateEllipsisText({required this.model});

  @override
  Widget build(BuildContext context) {
    return EllipsisText(
      DateFormat('EEEE, MMMM dd')
          .format(DateTime.parse(model.weatherData.date)),
      style:
          context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }
}

class _BuildHeader extends StatelessWidget {
  WeatherViewModel model;
  _BuildHeader({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BuildHeaderButton(
            icon: const Icon(Icons.add),
            onTap: () {},
          ),
          EllipsisText(
            model.weatherData.location,
            style: context.textTheme.headlineMedium!
                .copyWith(fontWeight: FontWeight.w100),
            textAlign: TextAlign.center,
          ),
          _BuildHeaderButton(
            icon: const Icon(Icons.more_vert),
            onTap: () {
              model.navigateToManageCities();
            },
          ),
        ],
      ),
    );
  }
}

class _BuildHeaderButton extends StatelessWidget {
  Icon icon;
  Function() onTap;
  _BuildHeaderButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          context.colors.tertiary,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(8),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      icon: icon,
      onPressed: onTap,
      color: ColorConstants.white,
    );
  }
}
