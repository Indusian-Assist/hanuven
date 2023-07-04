import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:hanuven/utils/constants/images_icons.dart';

class Retailer extends StatelessWidget {
  const Retailer({super.key});

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
                  image: DecorationImage(
                      image: kProfileBgImage, fit: BoxFit.cover)),
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: size.width / 12 + 2),
                        padding: EdgeInsets.all(2),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: kProfileImage, fit: BoxFit.cover)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tanishk Sahni',
                                  style: GoogleFonts.urbanist(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  padding: EdgeInsets.all(0.0),
                                  icon: Icon(Icons.edit_document),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/editprofile');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3.0),
                            padding: EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            width: 100,
                            child: Text(
                              'RETAILER',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(Icons.pin_drop),
                            Text('Delhi, India'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      'Lorem Ipsum',
                      style: GoogleFonts.urbanist(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                    style: GoogleFonts.urbanist(
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Products Activated',
                      style: GoogleFonts.urbanist(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: kGreyColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: kGreyColor,
                              ),
                              Text(
                                'Product1',
                                style: GoogleFonts.urbanist(
                                  color: kTextLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //Todo:
                        },
                        child: Container(
                          height: 50,
                          width: 280,
                          margin: EdgeInsets.symmetric(vertical: 12),
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kButtonColor,
                          ),
                          child: Text(
                            'ORDER DETAILS',
                            style: GoogleFonts.urbanist(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kLightColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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

    var firstStart = Offset(w / 12, h);
    var firstEnd = Offset(w / 6, h - h / 6);

    var secondStart = Offset(w / 3, h / 2);
    var secondEnd = Offset(w / 2, h - h / 6);

    var thirdStart = Offset(w * (7 / 12), h);
    var thirdEnd = Offset(w * (2 / 3), h);

    path.moveTo(0, 0); // 1. Point
    path.lineTo(0, h); // 2. Point
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy); //3,4. Point
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx,
        secondEnd.dy); // 5,6. Point
    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy); //7,8. Point
    path.lineTo(w, h); //9. Point
    path.lineTo(w, 0); //10. Point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
