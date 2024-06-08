import 'package:flutter/material.dart';
import 'package:weather/core/base/model/base_view_model.dart';
import 'package:weather/core/data/local/weather_data.dart';
import 'package:weather/core/models/weather_model.dart';
import 'package:weather/core/constants/navigation_constants.dart';

class WeatherViewModel extends BaseViewModel {
  WeatherViewModel() : super();

  late WeatherModel _weatherData;

  WeatherModel get weatherData => _weatherData;

  @override
  void setContext(BuildContext context) => context = context;

  void init() {
    _weatherData = WeatherData.weatherData;
  }

  void navigateToManageCities() {
    navigationService.navigateToPage(path: NavigationConstants.MANAGE_CITIES);
  }

  void navigateToNext7Days() {
    navigationService.navigateToPage(path: NavigationConstants.NEXT_7_DAYS);
  }
}
