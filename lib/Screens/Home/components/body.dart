import 'package:flutter/material.dart';
import 'package:hanuven/utils/constants/color.dart';

import '../../../utils/constants/images_icons.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              //TODO s
            },
          ),
        ),
        actions: [
          Container(
            child: IconButton(
              icon: Image.asset(
                kMainIconUrl,
              ),
              onPressed: () {
                //TODO
              },
            ),
          ),
        ],
      ),
    );
  }
}
