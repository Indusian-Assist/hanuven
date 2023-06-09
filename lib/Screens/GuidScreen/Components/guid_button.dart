import 'package:flutter/material.dart';
import 'package:hanuven/utils/constants/text_styles.dart';

import '../../../utils/constants/color.dart';

class GuidButton extends StatelessWidget {
  const GuidButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(child: Text('ENTER HANUVEN', style: kDefaultBoldTextStyle,)),
        height: 50,
        width: 270,
        decoration: BoxDecoration(
          color: kLightColor,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
