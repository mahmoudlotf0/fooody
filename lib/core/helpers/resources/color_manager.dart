import 'package:flutter/material.dart';

class ColorManager {
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#E61F34');
  static Color grey = HexColor.fromHex('#EFEFEF');
  static Color darkGrey = HexColor.fromHex('#73777B');
  static Color black = HexColor.fromHex('#000000');
  static Color primary = HexColor.fromHex('#5BB31B');
  static Color blue = HexColor.fromHex('#0096FF');
  static Color red = HexColor.fromHex('#EB1D36');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
