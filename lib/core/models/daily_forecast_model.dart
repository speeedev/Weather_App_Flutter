import 'package:flutter/material.dart';

class DailyForecastModel {
  final DateTime date;
  final int temperature;
  final Icon weatherIcon;

  DailyForecastModel({
    required this.date,
    required this.temperature,
    required this.weatherIcon,
  });
}