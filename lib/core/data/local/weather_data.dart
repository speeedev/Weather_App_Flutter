import 'package:flutter/material.dart';
import 'package:weather/core/models/daily_forecast_model.dart';
import 'package:weather/core/models/hourly_forecast_model.dart';
import 'package:weather/core/models/weather_model.dart';

class WeatherData {
  static final WeatherModel weatherData = WeatherModel(
    location: 'Ankara',
    date: '2021-09-01',
    weatherCondition: 'Sunny',
    currentTemperature: 25,
    currentWeatherDescription: 'Sunny',
    feelsLikeTemperature: 27,
    chanceOfRain: 90,
    airQualityIndex: 100,
    humidity: 70,
    todayForecast: [
      HourlyForecastModel(
        time: '00:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '01:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '02:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '03:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '04:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '05:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '06:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '07:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '08:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '09:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '10:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '11:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '12:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '13:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '14:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '15:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      HourlyForecastModel(
        time: '16:00',
        temperature: 25,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
    ],
    weeklyForecast: [
      DailyForecastModel(
        date: DateTime(2024, 1, 1),
        temperature: 21,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      DailyForecastModel(
        date: DateTime(2024, 1, 2),
        temperature: 21,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      DailyForecastModel(
        date: DateTime(2024, 1, 3),
        temperature: 21,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      DailyForecastModel(
        date: DateTime(2024, 1, 4),
        temperature: 21,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      DailyForecastModel(
        date: DateTime(2024, 1, 5),
        temperature: 21,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      DailyForecastModel(
        date: DateTime(2024, 1, 6),
        temperature: 21,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
      DailyForecastModel(
        date: DateTime(2024, 1, 7),
        temperature: 21,
        weatherIcon: const Icon(Icons.wb_sunny),
      ),
    ],
  );
}
