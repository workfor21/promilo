import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

loadingWidget() {
  return Center(
    child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(color: Colors.white,)),
  );
}