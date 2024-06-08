import 'package:flutter/material.dart';

class HourlyForecastModel {
  final String time;
  final int temperature;
  final Icon weatherIcon;

  HourlyForecastModel({
    required this.time,
    required this.temperature,
    required this.weatherIcon,
  });
}