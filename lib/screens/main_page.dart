import 'package:flutter/material.dart';
import 'package:meditaion_app/resources/index.dart';

import 'package:provider/provider.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Size get s => MediaQuery.of(context).size;
  PageController pageController = PageController();
  bool openSeeAll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Consumer3<PagesState, SeeAllType, OpenPlaying>(builder:
          (BuildContext context, PagesState pageState, SeeAllType typeState,
              OpenPlaying playingState, Widget child) {
        return Container(
          width: s.width,
          height: s.height,
          child: Stack(
            children: [
              PageView(
                controller: pageController,
                children: [
                  Home(),
                  Lessons(),
                  Meditation(),
                  Profile(),
                ],
              ),
              AnimatedPositioned(
                child: SeeAll(
                  closeSeeAll: () {
                    setState(() {
                      openSeeAll = !openSeeAll;
                    });
                  },
                ),
                top: typeState.openSeeAll ? 0 : s.height,
                duration: Duration(milliseconds: 120),
              ),
              bottomBar(
                s,
                icons: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      pageState.changePage(index);
                      if (typeState.openSeeAll) typeState.changeSeeAll();
                      pageController.animateToPage(
                        pageState.page,
                        duration: Duration(milliseconds: 240),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: bottomBarItem(
                      img: bottomIcons[index].img,
                      isActive: bottomIcons[index].idx == pageState.page,
                    ),
                  );
                }),
              ),
              AnimatedPositioned(
                child: Playing(),
                top: playingState.minimizePlaying
                    ? s.height - hh(144)
                    : playingState.openPlaying
                        ? 0
                        : s.height,
                duration: Duration(milliseconds: 120),
              ),
            ],
          ),
        );
      }),
    );
  }
}

Widget bottomBar(Size s, {List<Widget> icons}) => Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: s.width,
        height: hh(75),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.25),
              offset: Offset(0, -5),
              blurRadius: 16,
            ),
          ],
        ),
        child: padding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: icons,
          ),
        ),
      ),
    );

class BottomModel {
  String img;
  int idx;

  BottomModel(this.img, this.idx);
}

List<BottomModel> bottomIcons = [
  BottomModel("home", 0),
  BottomModel("book", 1),
  BottomModel("meditation", 2),
  BottomModel("profile", 3),
];

Widget bottomBarItem({String img, bool isActive}) => Container(
      padding: EdgeInsets.all(hh(12)),
      color: white,
      child: Image.asset(
        "assets/img/icons/$img.png",
        height: hh(28),
        color: isActive ? blueText : lightGray,
      ),
    );
