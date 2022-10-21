import 'package:flutter/material.dart';
import '../presentation/resources/route_manager.dart';
import '../presentation/resources/theme_manager.dart';
import '../presentation/splash/splash.dart';

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
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RouteManager.splashRoute,
      home: SplashScreen(),
    );
  }
}
