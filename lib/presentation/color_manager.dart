import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryColor = HexColor.fromColor("#ED9728");
  static Color grey = HexColor.fromColor("#737477");
  static Color darkGrey = HexColor.fromColor("#525252");
  static Color liteGrey = HexColor.fromColor("#9E9E9E");
  static Color primaryOpacity = HexColor.fromColor("#B3ED9728");

  static Color darkPrimary = HexColor.fromColor("#d17d11");
  static Color grey1 = HexColor.fromColor("#707070");
  static Color grey2 = HexColor.fromColor("#797979");
  static Color white = HexColor.fromColor("#FFFFFF");
  static Color error = HexColor.fromColor("#e61f34");



}

extension HexColor on Color {
  static Color fromColor(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
