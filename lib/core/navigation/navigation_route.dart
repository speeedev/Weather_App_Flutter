import 'package:flutter/material.dart';
import 'package:weather/core/constants/navigation_constants.dart';
import 'package:weather/ui/screens/manage_cities/view/manage_cities_view.dart';
import 'package:weather/ui/screens/next_7_days/view/next_7_days_view.dart';
import 'package:weather/ui/screens/splash/view/splash_view.dart';
import 'package:weather/ui/screens/weather/view/weather_view.dart';
import 'package:weather/ui/shared/widget/ellipsis_text.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT);

      case NavigationConstants.WEATHER:
        return normalNavigate(const WeatherView(), NavigationConstants.WEATHER);
      case NavigationConstants.MANAGE_CITIES:
        return normalNavigate(
            const ManageCitiesView(), NavigationConstants.MANAGE_CITIES);
      case NavigationConstants.NEXT_7_DAYS:
        return normalNavigate(
            const Next7DaysView(), NavigationConstants.NEXT_7_DAYS);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: EllipsisText('Bu sayfa bulunamadı'),
            ),
          ),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
