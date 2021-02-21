import 'package:flutter/material.dart';
import 'package:meditaion_app/resources/index.dart';
import 'package:provider/provider.dart';

class SeeAll extends StatelessWidget {
  final Function closeSeeAll;

  const SeeAll({Key key, this.closeSeeAll}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double appheight = MediaQuery.of(context).padding.top + 80;
    return Consumer<SeeAllType>(
      builder: (BuildContext context, state, Widget child) {
        return Container(
          width: s.width,
          height: s.height,
          color: white,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: appheight + hh(16)),
                    ...List.generate(
                        state.type == "popular"
                            ? popItems.length
                            : newItems.length, (index) {
                      return item(
                        item: state.type == "popular"
                            ? popItems[index]
                            : newItems[index],
                      );
                    }),
                    SizedBox(height: hh(75)),
                  ],
                ),
              ),
              Container(
                width: s.width,
                height: appheight,
                decoration: BoxDecoration(
                  color: white,
                  border: Border(
                    bottom: BorderSide(
                      color: lightGray.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: Center(
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: black,
                            onPressed: () {
                              state.changeSeeAll();
                            }),
                      ),
                    ),
                    Text(
                      state.type.toUpperCase(),
                      style: med16(color: black),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemModel {
  String img;
  String title;
  String subtitle;

  ItemModel(this.img, this.title, this.subtitle);
}

List<ItemModel> popItems = [
  ItemModel("pop1", "Mental Training", "3min 43sec"),
  ItemModel("pop2", "Graditude", "3min 43sec"),
  ItemModel("pop3", "The Cure for Baredom", "3min 43sec"),
  ItemModel("pop4", "Free Will 1", "3min 43sec"),
  ItemModel("pop5", "Free Will 2", "3min 43sec"),
  ItemModel("pop6", "Spiritual 1", "3min 43sec"),
  ItemModel("pop7", "Spiritual 2", "3min 43sec"),
  ItemModel("pop8", "Anxiety", "3min 43sec"),
];

List<ItemModel> newItems = [
  ItemModel("pop2", "Graditude", "3min 43sec"),
  ItemModel("pop1", "Mental Training", "3min 43sec"),
  ItemModel("pop4", "Free Will 1", "3min 43sec"),
  ItemModel("pop3", "The Cure for Baredom", "3min 43sec"),
  ItemModel("pop6", "Spiritual 1", "3min 43sec"),
  ItemModel("pop5", "Free Will 2", "3min 43sec"),
  ItemModel("pop8", "Anxiety", "3min 43sec"),
  ItemModel("pop7", "Spiritual 2", "3min 43sec"),
];

Widget item({ItemModel item}) => padding(
      child: Container(
        width: ww(343),
        height: hh(72.5),
        margin: EdgeInsets.only(bottom: hh(8.5)),
        alignment: Alignment.topCenter,
        child: Container(
          height: hh(64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: ww(90),
                    height: hh(64),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(hh(12)),
                      image: DecorationImage(
                        image: AssetImage("assets/img/images/${item.img}.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: ww(15)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.title,
                        style: reg17(color: black),
                      ),
                      Text(
                        item.subtitle,
                        style: light15(color: lightGray),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: ww(22),
                height: ww(22),
                child: Image.asset(
                  "assets/img/icons/like.png",
                  color: lightGray,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: lightGray.withOpacity(0.5),
              width: 1,
            ),
          ),
        ),
      ),
    );
