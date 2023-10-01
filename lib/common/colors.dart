import 'package:flutter/material.dart';

class ConstColors {
  static Color hexToColors(hexString) =>
      Color(int.parse(hexString, radix: 16) + 0xFF000000);
}
