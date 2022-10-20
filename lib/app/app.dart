import 'package:flutter/material.dart';
import '../presentation/resources/route_manager.dart';
import '../presentation/resources/theme_manager.dart';

class App extends StatefulWidget {
  App._interval(); // private named constructor
  static final App instance = App._interval(); // instance
  factory App() => instance; // factory
  String title = "Good";

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RouteManager.splashRoute,
      home: Scaffold(),
    );
  }
}
