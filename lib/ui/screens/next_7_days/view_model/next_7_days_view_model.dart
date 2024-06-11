import 'package:flutter/material.dart';
import 'package:weather/core/base/model/base_view_model.dart';
import 'package:weather/core/data/local/weather_data.dart';
import 'package:weather/core/models/daily_forecast_model.dart';

class Next7DaysViewModel extends BaseViewModel {
  Next7DaysViewModel() : super();

  late List<DailyForecastModel> _weeklyForecast;

  List<DailyForecastModel> get weeklyForecast => _weeklyForecast;
  final ScrollController _scrollController = ScrollController();  ScrollController get scrollController => _scrollController;
  bool get appbarTransparent => _appbarTransparent;
  bool _appbarTransparent = false;
  @override
  void setContext(context) => context = context;


  void init() {
    _weeklyForecast = WeatherData.weatherData.weeklyForecast;
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    _appbarTransparent = _scrollController.offset > kToolbarHeight;
    notifyListeners();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
