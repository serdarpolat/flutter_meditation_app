import 'package:flutter/material.dart';
import 'package:meditaion_app/resources/index.dart';
import 'package:provider/provider.dart';

class Lessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: white,
        title: Text(
          "Practices",
          style: med16(color: black),
        ),
      ),
      body: Consumer<OpenPlaying>(
        builder: (BuildContext context, playingState, Widget child) {
          return Container(
            width: s.width,
            height: s.height,
            color: white,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: hh(16)),
                  Container(
                    width: s.width,
                    height: hh(210),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: ww(16)),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: ww(16)),
                          child: GestureDetector(
                            onTap: () {
                              playingState.changePlayingState();
                            },
                            child: practiceCards[index],
                          ),
                        );
                      },
                      itemCount: 2,
                    ),
                  ),
                  SizedBox(height: hh(27)),
                  padding(
                    child: Text(
                      "All Practices",
                      style: reg24(color: black),
                    ),
                  ),
                  SizedBox(height: hh(25)),
                  ...List.generate(newItems.length, (index) {
                    return item(item: newItems[index]);
                  }),
                  SizedBox(height: hh(75)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Widget> practiceCards = [
  practiceCard(
    title: "Mental Training",
    subtitle: "Turn down the stress\nvolume",
    progress: "3min, 14sec",
    img: "leafs1a",
    color: darkPurple,
  ),
  practiceCard(
    title: "Guided Breath",
    subtitle: "To power of deep calm",
    progress: "3min, 14sec",
    img: "eagle",
    color: teal,
  ),
];

Widget practiceCard(
        {String title,
        String subtitle,
        String img,
        String progress,
        Color color}) =>
    Container(
      width: ww(310),
      height: hh(210),
      child: Stack(
        overflow: Overflow.clip,
        children: [
          Container(
            height: hh(159),
            margin: EdgeInsets.only(left: ww(22), top: ww(22)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: semi28(color: white),
                ),
                SizedBox(height: hh(12)),
                Text(
                  subtitle,
                  style: reg16(color: gray),
                ),
                Spacer(),
                Text(
                  progress,
                  style: light15(color: gray),
                ),
              ],
            ),
          ),
          Positioned(
            top: ww(22),
            right: ww(22),
            child: Image.asset(
              "assets/img/icons/like.png",
              width: 22,
              color: gray,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: ww(150),
              height: ww(150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(hh(24)),
                image: DecorationImage(
                  image: AssetImage("assets/img/images/$img.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(hh(24)),
        color: color,
      ),
    );
