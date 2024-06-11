import 'package:flutter/material.dart';
import 'package:weather/core/constants/app_constants.dart';
import 'package:weather/core/constants/color_constants.dart';
import 'package:weather/core/constants/navigation_constants.dart';
import 'package:weather/core/extension/color_extension.dart';
import 'package:weather/core/extension/context_extension.dart';
import 'package:weather/core/navigation/navigation_route.dart';
import 'package:weather/core/navigation/navigation_service.dart';
import 'package:weather/core/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ApplicationConstants.APP_NAME,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: NavigationConstants.DEFAULT,
      theme: AppTheme.buildThemeData(context),
    );
  }
}
