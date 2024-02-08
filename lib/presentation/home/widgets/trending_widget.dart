import 'package:flutter/material.dart';
import 'package:promilo/data/model/trending_model.dart';
import 'package:promilo/presentation/!components/custom_asset_image_widget.dart';
import 'package:promilo/presentation/!components/header_widget.dart';
import 'package:sizable/sizable.dart';

TrendingWidget(BuildContext context,{required TrendingModel data,}) {
  return Container(
    padding: spacing(),
    margin: spacing(),
    width: width(context) * .8,
    decoration: BoxDecoration(
      border: Border.all(width: 2, color: Colors.blueGrey),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Align(
             alignment: Alignment.centerLeft,
              child: Container(
                padding: spacing(value: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 2,color: Colors.black54,),
                ),
                child: Icon(Icons.energy_savings_leaf_outlined,size: 20,),
              ),
            ),
            10.sizew,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            headerWidget(data.title ?? '',fontSize: 16),
            headerWidget("${data.subscibers} Meetups",fontSize: 12,color: Colors.black54),
              ],
            )
          ],
        ),
        Padding(
          padding:spacingSym(v:0),
          child: Divider(),
        ),
        Row(
          children: List.generate(
            5,
            (index) => Transform.translate(
              offset: index != 0 ? Offset((-10 * index.toDouble()), 0) : Offset(0, 0),
              child: customAssetsImage("assets/images/off-${index + 1}.jpg",
                  size: 50),
            ),
          ),
        ),
        20.sizeh,
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 100,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Colors.blueGrey),
                // side: MaterialStateProperty.all(
                //   BorderSide(width: 2, color: Colors.blueAccent),
                // ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: () {
              },
              child: headerWidget("See More",
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "PoppinsSemiBold"),
            ),
          ),
        ),
      ],
    ),
  );
}
