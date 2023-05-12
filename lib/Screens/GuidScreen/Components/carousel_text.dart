import 'package:flutter/material.dart';
import 'package:hanuven/utils/constants/text_styles.dart';


// ignore: must_be_immutable
class CarouselText extends StatelessWidget {
  int currentIndex;
  CarouselText({Key? key, required this.currentIndex}) : super(key: key);


  List<String> _messages = [    "Lorem ipsum dolor sitamet",    "Lorem ipsum dolor sitamet",    "Lorem ipsum dolor sitamet",  ];
  List<String> _messages2 = ["consectetur", "consectetur", "consectetur"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _messages[currentIndex],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          _messages2[currentIndex],
          style: kDefaultBoldTextStyle
          ),
      ],
    );
  }
}
