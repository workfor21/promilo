import 'package:flutter/material.dart';
import 'package:sizable/sizable.dart';

IconTextWidget({required IconData icon, required String text}) {
  return Row(children: [
    Icon(
      icon,
      color: Colors.blue,
    ),
    5.sizew,
    Text(text,style: TextStyle(fontWeight: FontWeight.bold)),
  ]);
}
