import 'package:flutter/material.dart';
import 'package:promilo/presentation/!components/custom_asset_image_widget.dart';
import 'package:promilo/presentation/!components/header_widget.dart';
import 'package:promilo/presentation/details/widget/icon_text_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizable/sizable.dart';

class TrendingDetailsScreen extends StatelessWidget {
  static const String routeName = "TrendingDetailsScreen";

  const TrendingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> iconsList = [
      Icons.download,
      Icons.bookmark_border,
      Icons.heart_broken,
      Icons.crop_3_2,
      Icons.star_border_outlined,
      Icons.share,
    ];
    return Scaffold(
      appBar: AppBar(
        title: headerWidget(
          "Description",
          fontSize: 20,
          alignment: Alignment.centerLeft,
        ),
      ),
      body: Padding(
        padding: spacing(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: height(context) * .5,
                child: Stack(
                  children: [
                    Positioned.fill(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                            6,
                            (index) => Padding(
                              padding: spacing(value: 5),
                              child: IconButton(
                                onPressed: () {
                                  if (iconsList.last == iconsList[index]) {
                                    Share.share("hello!");
                                  }
                                },
                                icon: Icon(iconsList[index]),
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      // top: 10,
                      bottom: 50,
                      // left: 10,
                      // right: 10,
                      child: customAssetsImage("assets/images/off-2.jpg",
                          radius: 10),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: spacingOnly(l: 15, t: 15),
                child: Row(children: [
                  IconTextWidget(icon: Icons.bookmark_border, text: "1023"),
                  15.sizew,
                  IconTextWidget(icon: Icons.heart_broken, text: "2123"),
                  15.sizew,
                  Container(
                    padding: spacingSym(v: 3, h: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.withOpacity(.3),
                    ),
                    child: Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index == 4 ? Icons.star_half : Icons.star,
                          size: 20,
                          color: Colors.blue,
                        );
                      }),
                    ),
                  ),
                  10.sizew,
                  Text(
                    "4.7",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              20.sizeh,
              headerWidget("Acton Name", alignment: Alignment.centerLeft),
              Text("Indian Actor"),
              10.sizeh,
              IconTextWidget(icon: Icons.timelapse, text: "Duration 20 mins"),
              IconTextWidget(icon: Icons.wallet, text: "Total Fee ₹20000"),
              20.sizeh,
              headerWidget("About",
                  fontSize: 18, alignment: Alignment.centerLeft),
              Text(
                  "The Indian rupee is the official currency in India. The rupee is subdivided into 100 paise. The issuance of the currency is controlled by the Reserve Bank of India. The Reserve Bank manages currency in India and derives its role in currency management on the basis of the Reserve Bank of India Act, 1934.",
              style: TextStyle(color: Colors.black87),
              ),
              50.sizeh
            ],
          ),
        ),
      ),
    );
  }
}
