import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/images_icons.dart';

class ProductState extends StatelessWidget {
  const ProductState({super.key});

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.5,
            child: Image.asset(
              kProduct1Url,
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
                          //Todo: Srijan perform an action
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
                        'PRODUCT 1',
                        style: GoogleFonts.urbanist(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          //padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextButton(
                            onPressed: () {
                              //Todo: Srijan Perform an action
                            },
                            child: Text('ACTIVATE'),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                textStyle: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.bold, fontSize: 10)),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 30,
                          //padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextButton(
                            onPressed: () {
                              //Todo: Srijan Perform an action
                            },
                            child: Text('RETURN'),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                textStyle: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.bold, fontSize: 10)),
                          ),
                        ),
                      ],
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
                    'This piece was part of the biggest and most ambitious project that Ive ever done in my 17-year long career as a digital artist (up until now, mid of february 2021). I recorded and documented everything of the 3-month long creation process into a 1.5-hour long video tutorial that took me almost 10 months to complete',
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
                        'INR 500',
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