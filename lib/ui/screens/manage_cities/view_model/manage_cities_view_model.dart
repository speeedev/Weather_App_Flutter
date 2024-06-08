import 'package:flutter/material.dart';
import 'package:weather/core/base/model/base_view_model.dart';
import 'package:weather/core/data/local/locations_data.dart';

class ManageCitiesViewModel extends BaseViewModel {
  @override
  void setContext(BuildContext context) => buildContext = context;

  final ScrollController _scrollController = ScrollController();
  bool _appbarTransparent = false;

  ScrollController get scrollController => _scrollController;
  bool get appbarTransparent => _appbarTransparent;

  final List _locations = LocationData.locations;
  get locations => _locations;

  void init() {
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
