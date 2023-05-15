import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/color.dart';

class Components {
  static Container customProductCard(
      String imageUrl, String headertxt, String desctxt) {
    return Container(
      height: 320,
      width: 200,
      margin: const EdgeInsets.all(3.0),
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
      child: AspectRatio(
        aspectRatio: 3/2,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  height: 160,
                  width: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image(image: AssetImage(imageUrl), fit: BoxFit.cover,),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  headertxt,
                  style: TextStyle(
                    color: kLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(255, 255, 255, 0.18),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        iconSize: 15,
                        icon: const Icon(Icons.north_east),
                        onPressed: () {
                          //Todo : Srijan add an action
                        },
                      ),
                    ),
                    Container(
                      height: 30,
                      //margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        child: Text('BUY NOW'),
                        style: TextButton.styleFrom(
                            foregroundColor: kTextColor,
                            textStyle: GoogleFonts.urbanist(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                        onPressed: () {
                          //Todo: Srijan add an action
                        },
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Price',style: GoogleFonts.urbanist(color:Colors.grey, fontSize: 12),),
                          Text('INR 300', style: GoogleFonts.urbanist(color: kLightColor, fontSize: 12),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
