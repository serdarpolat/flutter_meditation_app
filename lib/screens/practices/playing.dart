import 'package:flutter/material.dart';
import 'package:meditaion_app/resources/index.dart';
import 'package:provider/provider.dart';

class Playing extends StatelessWidget {
  final Function playing;
  final double topMargin;
  final double fontSize;
  final double iconPos;

  const Playing(
      {Key key, this.playing, this.topMargin, this.fontSize, this.iconPos})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Consumer<OpenPlaying>(builder: (context, state, child) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 320),
        width: s.width,
        height: s.height,
        child: Stack(
          children: [
            Positioned(
              top: iconPos,
              right: ww(1),
              child: IconButton(
                  icon: Icon(Icons.close),
                  color: gray,
                  iconSize: 36,
                  onPressed: () {
                    state.changePlayingState();
                  }),
            ),
            Column(
              children: [
                SizedBox(height: topMargin),
                Text(
                  "Mental Training",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.expand_more_rounded),
                  color: white,
                  onPressed: playing,
                ),
                SizedBox(height: hh(44)),
                Container(
                  width: s.width,
                  height: hh(504.61),
                  child: Image.asset(
                    "assets/img/images/playing_bg.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: ww(305),
                  height: hh(115),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: gray,
                            onPressed: () {},
                            iconSize: 28,
                          ),
                          IconButton(
                            icon: Icon(Icons.play_circle_outline_sharp),
                            color: gray,
                            onPressed: () {},
                            iconSize: 56,
                          ),
                          IconButton(
                            icon: Icon(Icons.tune),
                            color: gray,
                            onPressed: () {},
                            iconSize: 28,
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: ww(305),
                        height: hh(8),
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: ww(305),
                                height: hh(2),
                                color: black.withOpacity(0.5),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: ww(51),
                                height: hh(2),
                                color: gray,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: ww(50),
                              child: Container(
                                width: ww(8),
                                height: ww(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: lightGray,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: hh(6)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "0:06",
                            style: reg12(color: white),
                          ),
                          Text(
                            "-2:56",
                            style: reg12(color: white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: darkPurple,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(state.minimizePlaying ? hh(24) : 0.0),
          ),
        ),
      );
    });
  }
}
