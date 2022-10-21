import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'styles_manager.dart';
import 'values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.primaryOpacity,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryOpacity,


    // card theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),


    // button theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primaryColor,
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.primaryOpacity,
    ),


    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        backgroundColor: ColorManager.primaryColor,
        textStyle: getRegularStyle(color: ColorManager.white),
      ),
    ),


    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(
          color: ColorManager.primaryColor,
          width: AppSize.s2,
        ),
      ),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      errorStyle: getRegularStyle(color: ColorManager.error),
      suffixIconColor: ColorManager.primaryColor,
      suffixStyle: getRegularStyle(color: ColorManager.grey1),
      prefixIconColor: ColorManager.primaryColor,
      prefixStyle: getRegularStyle(color: ColorManager.grey1),
    ),


    // app bar theme
    appBarTheme: AppBarTheme(
      color: ColorManager.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity,
      centerTitle: true,
      titleTextStyle: getRegularStyle(
        color: ColorManager.darkPrimary,
        fontSize: FontSize.s16,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),


    // text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s16,
      ),
      subtitle1: getMediumStyle(
        color: ColorManager.liteGrey,
        fontSize: FontSize.s14,
      ),
      caption: getRegularStyle(
        color: ColorManager.grey1,
        fontSize: FontSize.s12,
      ),
      bodyText1: getRegularStyle(
        color: ColorManager.grey,
      ),
    ),

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
    ),
  );
}
