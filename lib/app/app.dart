import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/resources/routes_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  /// Static [_instance] to be accessed from any where
  // and Still be one instance
  static const _instance = MyApp._internal();

  // Factory to return the _instance with the name MyApp
  factory MyApp() => _instance;

  // Named Private Constructor
  const MyApp._internal();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      onGenerateRoute: RoutesGenerator.getRoute,
      theme: getAppTheme(),
    );
  }
}
