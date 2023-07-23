import 'package:flutter/material.dart';
import 'package:hanuven/Screens/GuidScreen/Components/carousel_slider.dart';
import 'package:hanuven/Screens/GuidScreen/Components/guid_button.dart';
import 'package:hanuven/utils/constants/color.dart';

class WelcomeBody extends StatefulWidget {
  WelcomeBody({Key? key, required this.onPressed}) : super(key: key);
  Function() onPressed;

  @override
  State<WelcomeBody> createState() => _BodyState();
}

class _BodyState extends State<WelcomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(flex: 1, child: Carousel()),
      Stack(
        children: <Widget>[
          Positioned(
            // top: 30,
            // left: 30,
            // height: 250,
            // width: 250,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(gradient: kBottomGradientColor
                  // LinearGradient(
                  //   begin: Alignment.bottomCenter,
                  //   end: Alignment.topCenter,
                  //   colors: [Colors.lightBlue, Colors.white],
                  ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: GuidButton(
                onPressed: widget.onPressed,
              ),
            ),
          )
        ],
      )
    ]);
  }
}
