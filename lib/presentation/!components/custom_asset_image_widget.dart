import 'package:flutter/material.dart';

customAssetsImage(String image,{double? size,double? radius}) {
  return SizedBox(
    width:size ?? 100,
    height:size ?? 100,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 100),
      child: Image.asset(image,fit: BoxFit.cover,),
    ),
  );
}