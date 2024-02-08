import 'package:flutter/material.dart';
import 'package:sizable/sizable.dart';

showSnackBar(BuildContext context, String message, {Color? color,double? elevation,String? alignment}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? Colors.blueGrey,
        behavior: SnackBarBehavior.floating,
        elevation: elevation ?? 2,
        margin: alignment == "top" ? spacingOnly(
          b: height(context) - 200,
          l: 10,
          r: 10,
        ):  spacing(),
        padding:spacing(value: 20),
      ),
    );
