import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:promilo/data/json/trending_data.dart';
import 'package:promilo/presentation/!components/custom_asset_image_widget.dart';
import 'package:promilo/presentation/!components/custom_text_field_widget.dart';
import 'package:promilo/presentation/!components/header_widget.dart';
import 'package:promilo/presentation/home/widgets/poster_widget.dart';
import 'package:promilo/presentation/home/widgets/trending_meetups.dart';
import 'package:promilo/presentation/home/widgets/trending_widget.dart';
import 'package:sizable/sizable.dart';

class HomeScreen extends HookWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kdots = useState(0);
    final knavIndex = useState(2);
    TextEditingController searchController = TextEditingController();
    List<String> posterTitles = [
      "Popular Meetups in India",
      "Special Events",
      "Startup Meetups"
    ];
    List<IconData> navIcons = [
      Icons.home,
      Icons.dashboard,
      Icons.handshake_outlined,
      Icons.search,
      Icons.person,
    ];
    List<String> navTitles = [
      "Home",
      "Projects",
      "Meetup",
      "Explore",
      "Profile",
    ];
    List<String> trendingTitles = ["Metaverse", "Startup", "KLF"];
    return Scaffold(
      appBar: AppBar(
        title: headerWidget("Individual Meetup",
            fontSize: 16, alignment: Alignment.centerLeft),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          knavIndex.value = val;
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: knavIndex.value,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: Colors.white,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        items: List.generate(
          5,
          (index) => BottomNavigationBarItem(
            label: navTitles[index],
            icon: Icon(
              navIcons[index],
              color: knavIndex.value == index ? Colors.blue : Colors.black54,
            ),
          ),
        ).toList(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customTextFieldWidget(
              controller: searchController,
              label: "Search",
              padding: spacing(),
              prefixIcon: Icon(
                Icons.search,
                // color: Colors.blue,
              ),
              suffixIcon: Icon(
                Icons.mic,
                // color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 180,
              child: PageView.builder(
                // reverse: true,
                onPageChanged: (val) {
                  kdots.value = val;
                },
                allowImplicitScrolling: true,
                itemCount: posterTitles.length,
                itemBuilder: (context, index) {
                  return PosterWidget(context,
                      text: posterTitles[index], index: index);
                },
              ),
            ),
            SizedBox(
              height: 23,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: posterTitles.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 13,
                    width: 13,
                    alignment: Alignment.center,
                    margin: spacing(value: 5),
                    decoration: BoxDecoration(
                      color:
                          kdots.value == index ? Colors.blue : Colors.black38,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  );
                },
              ),
            ),
            20.sizeh,
            headerWidget(
              "Trending Popular People",
              fontSize: 18,
              alignment: Alignment.centerLeft,
              padding: spacingSym(),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: trendingList.length,
                itemBuilder: (context, index) {
                  return TrendingWidget(context, data: trendingList[index]);
                },
              ),
            ),
            20.sizeh,
            headerWidget(
              "Top Trending Meetups",
              fontSize: 18,
              alignment: Alignment.centerLeft,
              padding: spacingSym(),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: trendingList.length,
                itemBuilder: (context, index) {
                  return TrendingMeetups(
                    context,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
