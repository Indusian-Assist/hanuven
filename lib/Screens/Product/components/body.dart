import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/images_icons.dart';

import '../../../utils/constants/color.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Container(
            height: size.height * 0.5,
            child: Image.asset(
              kProduct1Url,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product 1',
                        style: GoogleFonts.urbanist(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        height: 30,
                        //margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          child: Text('BUY NOW'),
                          style: TextButton.styleFrom(
                              foregroundColor: kLightColor,
                              textStyle: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.bold, fontSize: 10)),
                          onPressed: () {
                            //Todo: Srijan add an action
                          },
                        ),
                      ),
                    ]),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Description',
                    style: GoogleFonts.urbanist(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: const TextStyle(
                      overflow: TextOverflow.visible,
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: GoogleFonts.urbanist(fontSize: 15),
                      ),
                      Text(
                        'INR 300',
                        style: GoogleFonts.urbanist(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
