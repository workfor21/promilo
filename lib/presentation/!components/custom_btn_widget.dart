import 'package:flutter/material.dart';

customButtonWidget({String? title,required Function function}) {
  return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6))),
        backgroundColor: MaterialStateProperty.all(
            Colors.blue.withOpacity(.5)),
      ),
      onPressed: () => function(),
      child: Text(title ?? "Title",style: TextStyle(color: Colors.white),));
}