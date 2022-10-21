import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_project/presentation/resources/route_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //navigate to on-boarding screen after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(RouteManager.onBoardingRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: ColorManager.primaryOpacity),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: Image.asset(ImageAsset.splashImage),
      ),
    );
  }
}
