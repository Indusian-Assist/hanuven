import 'package:flutter/material.dart';

import '../../../utils/constants/images_icons.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Center(
        child: Image(image: kMainIcon, width: 200, height: 200),
      ),);
  }
}