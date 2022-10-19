import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getStyle(
  double fontSize,
  String fontFamily,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
  );
}


// regular fontstyle
TextStyle getRegularStyle({
  fontSize = FontSize.s12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
  );
}
