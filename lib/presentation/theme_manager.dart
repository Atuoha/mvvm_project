import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/styles_manager.dart';
import 'package:mvvm_project/presentation/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.primaryOpacity,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryOpacity,
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    buttonTheme: ButtonTheme(child: child),
    inputDecorationTheme: InputDecorationTheme(),
    appBarTheme: AppBarTheme(
      color: ColorManager.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity,
      centerTitle: true,
      titleTextStyle: getRegularStyle(
        color: ColorManager.darkPrimary,
        fontSize: FontSize.s18,
      ),
    ),
    textTheme: TextTheme(),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
    ),
  );
}
