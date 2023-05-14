import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';

class Components {
  static Container customProductCard(
      String imageUrl, String headertxt, String desctxt) {
    return Container(
      height: 420,
      width: 300,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          boxShadow: const [
            BoxShadow(
              blurRadius: 25,
              color: Color.fromARGB(31, 178, 173, 173),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 245,
                width: 260,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(image: AssetImage(imageUrl)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                headertxt,
                style: TextStyle(
                  color: kLightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(255, 255, 255, 0.18),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                child: Text(
                  desctxt,
                  style: const TextStyle(
                    overflow: TextOverflow.visible,
                    fontSize: 10,
                    color: kLightColor,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: IconButton(
                      iconSize: 15,
                      icon: const Icon(Icons.north_east),
                      onPressed: () {
                        //TODO
                      },
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    child: Text('BUY NOW'),
                    style: TextButton.styleFrom(
                        foregroundColor: kTextColor,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                    onPressed: () {
                      //TODO
                    },
                  ),
                ),
                Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
