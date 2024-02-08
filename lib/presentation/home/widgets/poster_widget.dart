import 'package:flutter/material.dart';
import 'package:promilo/presentation/!components/custom_asset_image_widget.dart';
import 'package:sizable/sizable.dart';

PosterWidget(BuildContext context, {required String text, required int index}) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    clipBehavior: Clip.hardEdge,
    padding: spacing(),
    child: Stack(
      children: [
        Positioned.fill(
          child: customAssetsImage("assets/images/off-${index + 1}.jpg",
              // size: 100,
              radius: 8),
        ),
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Colors.black38,
                Colors.black.withOpacity(.1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        )),
        Positioned(
          left: 10,
          bottom: 15,
          child: SizedBox(
            width: width(context) * .5,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PoppinsSemiBold",
                fontSize: 18,
              ),
              maxLines: 2,
            ),
          ),
        ),
      ],
    ),
  );
}
