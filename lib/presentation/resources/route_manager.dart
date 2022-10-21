import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/authentication/forgot_password.dart';
import 'package:mvvm_project/presentation/authentication/login.dart';
import 'package:mvvm_project/presentation/authentication/register.dart';
import 'package:mvvm_project/presentation/main/main.dart';
import 'package:mvvm_project/presentation/main/store_details.dart';
import 'package:mvvm_project/presentation/resources/string_manager.dart';
import 'package:mvvm_project/presentation/splash/splash.dart';
import '../onboarding/onboarding.dart';
import 'assets_manager.dart';

class RouteManager {
  static const splashRoute = '/';
  static const onBoardingRoute = '/on_boarding';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const forgotPasswordRoute = '/forgot_password';
  static const mainScreenRoute = '/main';
  static const detailScreenRoute = '/details';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteManager.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case RouteManager.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case RouteManager.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case RouteManager.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case RouteManager.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );

      case RouteManager.mainScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );

      case RouteManager.detailScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const StoreDetails(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppString.unknownPage),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAsset.unknownRouteImage),
            const Text(AppString.unknownPage),
          ],
        ),
      ),
    );
  }
}
