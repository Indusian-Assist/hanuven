import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:hanuven/utils/constants/images_icons.dart';
import 'details.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: size.height / 4,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: kProfileBgImage, fit: BoxFit.cover)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    //error
                    Container(
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        icon: Image.asset(
                          kMainIconUrl,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 90,
                ),

                // Profile Details
                ProfileDetails(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    var firstStart = Offset(w / 4, h);
    var firstEnd = Offset(w / 3, h - h / 6);

    var secondStart = Offset(w / 2, h / 2);
    var secondEnd = Offset(w * (2 / 3), h - h / 6);

    var thirdStart = Offset(w * (3 / 4), h);
    var thirdEnd = Offset(w * (10 / 12), h);

    path.moveTo(0, 0); // 1. Point
    path.lineTo(0, h); // 2. Point
    path.lineTo(w / 6, h); // 3. Point
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy); //4,5. Point
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx,
        secondEnd.dy); //6,7. Point
    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy); //8,9. Point
    path.lineTo(w, h); //10. Point
    path.lineTo(w, 0); // 11. Point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
