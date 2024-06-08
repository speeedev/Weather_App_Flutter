import 'package:weather/core/base/model/base_view_model.dart';
import 'package:weather/core/data/local/weather_data.dart';
import 'package:weather/core/models/daily_forecast_model.dart';

class Next7DaysViewModel extends BaseViewModel {
  Next7DaysViewModel() : super();

  late List<DailyForecastModel> _weeklyForecast;

  List<DailyForecastModel> get weeklyForecast => _weeklyForecast;

  @override
  void setContext(context) => context = context;

  void init() {
    _weeklyForecast = WeatherData.weatherData.weeklyForecast;
  }
}
