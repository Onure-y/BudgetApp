import 'package:flutter/material.dart';

class ColorConverter {
  static Color convertColorFromString(String stringColor) {
    Color convertedColor = Color(int.parse('0xff' + stringColor));
    return convertedColor;
  }
}
