import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hanuven/Screens/Login/Components/carousel_slider.dart';
import 'package:hanuven/Screens/Login/Components/guid_button.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  State<WelcomeBody> createState() => _BodyState();
}

class _BodyState extends State<WelcomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(

        children: [
      Expanded(
          flex: 1,
          child: Carousel()),
      Stack(
        children: <Widget>[
          Positioned(
            // top: 30,
            // left: 30,
            // height: 250,
            // width: 250,
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.lightBlue, Colors.white],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: GuidButton(),
            ),
          )
        ],
      )
    ]);
  }
}