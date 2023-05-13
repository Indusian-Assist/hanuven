import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              //TODO
            },
          ),
        ),
        actions: [
          Container(
            height: 100,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
          ),
          //scan button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 75),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {},
                  child: const Text('Scan Products'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: Text(
              'Our Products',
              style: GoogleFonts.poppins(
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
