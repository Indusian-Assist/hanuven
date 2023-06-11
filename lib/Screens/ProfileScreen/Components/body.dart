import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/images_icons.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              image: DecorationImage(image: kProduct1Image, fit: BoxFit.cover)),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(10),
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
                  Text(
                    'Profile',
                    style: GoogleFonts.urbanist(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            image: DecorationImage(
                                image: kProduct2Image, fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 15),
                    child: Text(
                      'Tanishk Sahni',
                      style: GoogleFonts.urbanist(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.pin_drop),
                            Text('India'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            Text('Age 26'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 75,
                        child: Text(
                          'Primary',
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 100, 169, 224),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 229, 234, 239),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ],
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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Scanned Products',
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
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                          Text(
                            'Product1',
                            style: GoogleFonts.urbanist(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: GestureDetector(
                  onTap: () {
                    //Todo: Tanishk
                  },
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(255, 80, 150, 255),
                    ),
                    child: Text(
                      'ORDER DETAILS',
                      style: GoogleFonts.urbanist(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
