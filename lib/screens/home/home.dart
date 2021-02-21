import 'package:flutter/material.dart';
import 'package:meditaion_app/resources/index.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        width: s.width,
        height: s.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(s),
              SizedBox(height: hh(40)),
              listLayout(
                s,
                title: "Popular",
                listItem: popularList,
                seeAll: () {
                  var seeAllState = Provider.of<SeeAllType>(context);
                  seeAllState.changeType("popular");
                  seeAllState.changeSeeAll();
                },
              ),
              SizedBox(height: hh(30)),
              listLayout(
                s,
                title: "New",
                listItem: newList,
                seeAll: () {
                  var seeAllState = Provider.of<SeeAllType>(context);
                  seeAllState.changeType("new");
                  seeAllState.changeSeeAll();
                },
              ),
              SizedBox(height: hh(99)),
            ],
          ),
        ),
      ),
    );
  }
}

class ListCardModel {
  String title;
  String subtitle;
  String steps;
  String training;
  String img;
  Color color;

  ListCardModel(this.title, this.subtitle, this.steps, this.training, this.img,
      this.color);
}

Widget listCard({ListCardModel model}) => Container(
      width: ww(293),
      height: hh(165),
      child: Stack(
        children: [
          Container(
            width: ww(156),
            margin: EdgeInsets.all(ww(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: semi28(color: white),
                ),
                SizedBox(height: hh(10)),
                Text(
                  model.subtitle,
                  style: reg16(color: white.withOpacity(0.8)),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "${model.steps} steps",
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w300,
                        fontSize: hh(12),
                      ),
                    ),
                    SizedBox(width: ww(6)),
                    Container(
                      width: 1,
                      height: hh(13),
                      color: white.withOpacity(0.8),
                    ),
                    SizedBox(width: ww(6)),
                    Text(
                      "${model.training} min",
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w300,
                        fontSize: hh(12),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: ww(16),
            right: ww(8),
            child: Container(
              width: ww(121),
              height: hh(135.37),
              child: Image.asset(
                "assets/img/images/${model.img}.png",
                width: ww(121),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.circular(hh(24)),
      ),
    );

Widget listLayout(Size s,
        {String title, Function seeAll, List<ListCardModel> listItem}) =>
    Container(
      width: s.width,
      height: hh(206),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: reg24(color: black),
                ),
                TextButton(
                  onPressed: seeAll,
                  child: Text(
                    "See All",
                    style: med16(color: blueText),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: s.width,
            height: hh(165),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: ww(16)),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: ww(16)),
                  child: listCard(
                    model: listItem[index],
                  ),
                );
              },
              itemCount: 2,
            ),
          ),
        ],
      ),
    );

List<ListCardModel> popularList = [
  ListCardModel(
    "Anxiety",
    "Turn down the stress volume",
    "7",
    "5 - 11",
    "tree",
    blue,
  ),
  ListCardModel(
    "Anxiety",
    "Turn down the stress volume",
    "7",
    "5 - 11",
    "eagle",
    teal,
  ),
];

List<ListCardModel> newList = [
  ListCardModel(
    "Happines",
    "Daily calm",
    "7",
    "3 - 11",
    "sun",
    orange,
  ),
  ListCardModel(
    "Spiritual",
    "Daily calm",
    "",
    "6 - 11",
    "moon",
    darkPurple,
  ),
];

Widget header(Size s) => Container(
      width: s.width,
      height: hh(313),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          title(),
          Positioned(
            top: hh(164),
            left: -ww(43),
            child: Container(
              width: ww(164),
              height: hh(168.51),
              child: Image.asset(
                "assets/img/images/leafs1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: hh(54),
            right: -ww(25),
            child: Container(
              width: ww(88),
              height: hh(151),
              child: Image.asset(
                "assets/img/images/leafs2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: hh(127),
            right: 0,
            child: Container(
              width: ww(201.36),
              height: hh(208.23),
              child: Image.asset(
                "assets/img/images/girl.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: darkPurple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(hh(24)),
        ),
      ),
    );

Widget title() => padding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: hh(54),
          ),
          Text(
            "DAY 7",
            style: semi13(color: lightGray),
          ),
          SizedBox(height: hh(6)),
          Container(
            width: ww(237),
            child: Text(
              "Love and Accept Yourself",
              style: semi30(color: white),
            ),
          ),
        ],
      ),
    );
