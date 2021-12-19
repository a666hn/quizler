import 'package:flutter/material.dart';

/// Create Font Style Using Heebo
TextStyle heeboFontStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontFamily: 'Heebo',
    fontSize: fontSize,
    color: color ?? Colors.white,
  );
}
