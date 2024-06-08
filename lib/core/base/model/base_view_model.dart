import 'package:flutter/material.dart';
import 'package:weather/core/navigation/navigation_base.dart';
import 'package:weather/core/navigation/navigation_service.dart';

abstract class BaseViewModel with ChangeNotifier {
  BuildContext? buildContext;
  
  NavigationServiceBase navigationService = NavigationService.instance;
  void setContext(BuildContext context) {
    buildContext = context;
  }
}
