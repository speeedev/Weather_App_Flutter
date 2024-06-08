import 'package:flutter/material.dart';
import 'package:weather/core/base/model/base_view_model.dart';
import 'package:weather/core/constants/navigation_constants.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void setContext(BuildContext context) => buildContext = context;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void init() {
    checkToken();
  }
  void checkToken() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 0));
    setLoading(false);
    navigationService.navigateToPageClear(path: NavigationConstants.WEATHER);
  }

  void setLoading(bool value) {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
