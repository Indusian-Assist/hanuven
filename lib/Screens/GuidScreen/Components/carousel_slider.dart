import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hanuven/Screens/GuidScreen/Components/carousel_text.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:hanuven/utils/constants/images_icons.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  List<String> _images = [kGuid1Url, kGuid2Url, kGuid3Url];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          items: _images.map((image) {
            return Container(
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 400,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 250,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 60,
        ),
        CarouselText(currentIndex: _currentIndex),
        SizedBox(
          height: 80,
        ),
        new DotsIndicator(
          dotsCount: _images.length,
          position: _currentIndex,
          decorator: DotsDecorator(
            color: kTextLightColor, // Inactive color
            activeColor: kTextColor,
          ),
        )
      ],
    );
  }
}
