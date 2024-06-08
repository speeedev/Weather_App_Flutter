import 'package:weather/core/models/daily_forecast_model.dart';
import 'package:weather/core/models/hourly_forecast_model.dart';

class WeatherModel {
  final String location;
  final String date;
  final String weatherCondition;
  final int currentTemperature;
  final String currentWeatherDescription;
  final int feelsLikeTemperature;
  final int chanceOfRain;
  final int airQualityIndex;
  final int humidity;
  final List<HourlyForecastModel> todayForecast;
  final List<DailyForecastModel> weeklyForecast;

  WeatherModel({
    required this.location,
    required this.date,
    required this.weatherCondition,
    required this.currentTemperature,
    required this.currentWeatherDescription,
    required this.feelsLikeTemperature,
    required this.chanceOfRain,
    required this.airQualityIndex,
    required this.humidity,
    required this.todayForecast,
    required this.weeklyForecast,
  });
}