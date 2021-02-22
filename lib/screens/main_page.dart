import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meditaion_app/resources/index.dart';

import 'package:provider/provider.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Size get s => MediaQuery.of(context).size;
  PageController pageController = PageController();
  bool openSeeAll = false;
  bool minimizePlaying = false;

  List<double> practices = [];
  List<double> meditations = [];
  Random rnd = new Random();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    for (var i = 0; i < 7; i++) {
      int p = 0 + rnd.nextInt(54 - 0);
      practices.add(p.toDouble());

      int m = 0 + rnd.nextInt((54 - p.toInt()) - 0);
      meditations.add(m.toDouble());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double topPos = 0;
    double bottomPos = s.height - hh(144);
    double lerp(double min, double max) =>
        lerpDouble(min, max, _controller.value);
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
              //* Pageview
              PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Home(),
                  Lessons(),
                  Meditation(),
                  Profile(
                    prac: practices,
                    med: meditations,
                  ),
                ],
              ),
              //* Se All
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

              //* Playing
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    child: Playing(
                      topMargin: lerp(hh(44), hh(12)),
                      fontSize: lerp(hh(24), hh(12)),
                      iconPos: lerp(36, 12),
                      playing: () {
                        _toggle();
                        setState(() {
                          minimizePlaying = !minimizePlaying;
                        });
                        playingState.changeMinimizeState();
                      },
                    ),
                    top: playingState.openPlaying
                        ? lerp(topPos, bottomPos)
                        : s.height,
                    left: 0,
                  );
                },
              ),
              //* Bottom Bar
              AnimatedPositioned(
                duration: Duration(milliseconds: 120),
                bottom: !playingState.openPlaying
                    ? 0
                    : minimizePlaying
                        ? 0
                        : -hh(75),
                left: 0,
                child: bottomBar(
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
              ),
            ],
          ),
        );
      }),
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2);
  }
}

Widget bottomBar(Size s, {List<Widget> icons}) => Container(
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
