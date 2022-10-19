import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryColor = HexColor.fromColor("#ED9728");
  static Color grey = HexColor.fromColor("#525252");
  static Color liteGrey = HexColor.fromColor("#737477");
  static Color darkGrey = HexColor.fromColor("#9EPEPE");
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
