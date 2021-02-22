import 'package:flutter/material.dart';
import 'package:meditaion_app/resources/index.dart';

class Profile extends StatelessWidget {
  final List<double> prac;
  final List<double> med;

  const Profile({Key key, this.prac, this.med}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: hh(64)),
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
                color: lightGray,
                iconSize: 36,
              ),
            ),
            Container(
              width: hh(85),
              height: hh(85),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: darkPurple,
                image: DecorationImage(
                  image: AssetImage("assets/img/images/avatar.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: hh(16)),
            Text(
              "Jane Doe",
              style: med24(color: black),
            ),
            SizedBox(height: hh(26)),
            trainingCard(
              title: "Practices",
              icon: "book",
              session: "13",
              time: "4:23:05",
              color: darkPurple,
            ),
            SizedBox(height: hh(16)),
            trainingCard(
              title: "Meditations",
              icon: "meditation",
              session: "6",
              time: "0:55:05",
              color: orange,
            ),
            SizedBox(height: hh(16)),
            stats(
              prac: prac,
              med: med,
            ),
            SizedBox(height: hh(75 + 16.0)),
          ],
        ),
      ),
    );
  }
}

Widget stats({List<double> prac, List<double> med}) => Container(
      width: ww(343),
      height: hh(220),
      padding: EdgeInsets.all(ww(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Stats",
                style: reg24(color: black),
              ),
              Row(
                children: [
                  Text(
                    "Last Week",
                    style: med12(color: black),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: black,
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          statType(color: darkPurple, title: "Practices", time: "0:43:05"),
          SizedBox(height: hh(2)),
          statType(color: orange, title: "Meditations", time: "0:15:45"),
          Spacer(),
          Container(
            width: ww(343) - 40,
            height: hh(73),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(weekDays.length, (index) {
                return column(
                  p: prac[index],
                  m: med[index],
                  d: weekDays[index],
                );
              }),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: gray.withOpacity(0.2),
        borderRadius: BorderRadius.circular(hh(22)),
      ),
    );

List<String> weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

Widget column({double p, double m, String d}) => Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        Container(
          width: ww(6),
          height: hh(m),
          color: orange,
        ),
        Container(
          width: ww(6),
          height: hh(p),
          color: darkPurple,
        ),
        SizedBox(height: hh(4)),
        Text(
          d,
          style: med12(color: lightGray),
        ),
      ],
    );

Widget statType({Color color, String title, String time}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: hh(7),
              height: hh(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
            SizedBox(width: ww(6)),
            Text(
              title,
              style: med12(color: lightGray),
            ),
          ],
        ),
        SizedBox(width: ww(27)),
        Row(
          children: [
            Icon(
              Icons.access_time_sharp,
              color: lightGray,
              size: 18,
            ),
            SizedBox(width: ww(6)),
            Text(
              time,
              style: med12(color: lightGray),
            ),
          ],
        ),
      ],
    );

Widget trainingCard(
        {String title,
        String icon,
        String session,
        String time,
        Color color}) =>
    Container(
      width: ww(343),
      height: hh(116),
      padding: EdgeInsets.only(left: ww(20), top: hh(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: hh(29),
                height: hh(29),
                padding: EdgeInsets.all(8),
                child: Image.asset("assets/img/icons/$icon.png", color: white),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: ww(8)),
              Text(
                title,
                style: reg24(color: black),
              ),
            ],
          ),
          SizedBox(height: hh(16)),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    "Session",
                    style: reg16(color: lightGray),
                  ),
                  SizedBox(width: ww(8)),
                  Text(
                    session,
                    style: light28(color: black),
                  ),
                ],
              ),
              SizedBox(width: ww(22)),
              Row(
                children: [
                  Text(
                    "Time",
                    style: reg16(color: lightGray),
                  ),
                  SizedBox(width: ww(8)),
                  Text(
                    time,
                    style: light28(color: black),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: gray.withOpacity(0.2),
        borderRadius: BorderRadius.circular(hh(22)),
      ),
    );
