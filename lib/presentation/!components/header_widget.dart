import 'package:flutter/material.dart';
import 'package:sizable/sizable.dart';

headerWidget(String title,
    {double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
      Alignment? alignment,
      EdgeInsets? padding,
    Color? color}) {
  return Padding(
    padding: padding ?? spacingOnly(),
    child: Align(
      alignment: alignment ?? Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize ?? 25,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontFamily: fontFamily,
          color: color,
        ),
      ),
    ),
  );
}
