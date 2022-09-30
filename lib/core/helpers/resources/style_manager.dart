import 'package:flutter/material.dart';
import 'package:foody/core/helpers/constants.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  String fontFamily,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

//* Regular Style
TextStyle getRegularStyle({
  double fontsize = 12,
  required Color color,
}) {
  return _getTextStyle(
    fontsize,
    FontWeight.normal,
    primaryFontFamily,
    color,
  );
}

//* Bold Style
TextStyle getBoldStyle({
  double fontsize = 12.0,
  required Color color,
}) {
  return _getTextStyle(
    fontsize,
    FontWeight.bold,
    primaryFontFamily,
    color,
  );
}
