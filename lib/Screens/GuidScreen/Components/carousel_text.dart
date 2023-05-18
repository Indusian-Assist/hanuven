import 'package:flutter/material.dart';
import 'package:hanuven/utils/constants/text_styles.dart';

// ignore: must_be_immutable
class CarouselText extends StatelessWidget {
  int currentIndex;
  CarouselText({Key? key, required this.currentIndex}) : super(key: key);

  List<String> _messages = [
    "Welcome to \nHanuven Healthcare Products Pvt. Ltd.",
    "Products that have been\n thoroughly tested and verified.",
    "Scan the product\n to see whether it is genuine..",
  ];
  List<String> _messages2 = [
    "Developed by IndusianAssist",
    "Developed by IndusianAssist",
    "Developed by IndusianAssist"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                _messages[currentIndex],
                style: k16DefaultTextStyle,
              ),
              SizedBox(height: 25),
              Text(
                _messages2[currentIndex],
                style: k10DefaultTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
