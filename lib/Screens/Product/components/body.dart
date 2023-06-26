import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/color.dart';
import '../../../utils/constants/images_icons.dart';

class Body extends StatelessWidget {
  final String pimage;
  final String title;
  final String desc;
  final String price;
  const Body({
    required this.pimage,
    required this.title,
    required this.desc,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.5,
          child: Image.asset(
            pimage,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
                      color: Colors.white,
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
                height: size.height * 0.4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      title,
                      style: GoogleFonts.urbanist(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: kDarkColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/thankyou');
                      },
                      child: Text('BUY NOW'),
                      style: TextButton.styleFrom(
                          foregroundColor: kLightColor,
                          textStyle: GoogleFonts.urbanist(
                              fontWeight: FontWeight.bold, fontSize: 10)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Description',
                  style: GoogleFonts.urbanist(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  desc,
                  style: GoogleFonts.urbanist(
                    fontSize: 12,
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
                      price,
                      style: GoogleFonts.urbanist(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        color: kDarkColor,
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
    );
  }
}
