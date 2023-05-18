import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/images_icons.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'THANK YOU FOR',
                  style: GoogleFonts.urbanist(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'SHOPPING',
                  style: GoogleFonts.urbanist(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(203, 44, 61, 1)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('By Tanishk'),
                        Text('01 May, 2023, 16:39 PM',
                            style: GoogleFonts.urbanist(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    //padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: TextButton(
                      onPressed: () {
                        //Todo: Srijan Perform an action
                      },
                      child: Text('CONTINUE SHOPPING'),
                     style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Description',
                  style: GoogleFonts.urbanist(fontSize: 16, fontWeight: FontWeight.w400),),
              ),
              Text('This piece was part of the biggest and most ambitious project that Ive ever done in my 17-year long career as a digital artist (up until now, mid of february 2021). I recorded and documented everything of the 3-month long creation process into a 1.5-hour long video tutorial that took me almost 10 months to complete',
              style: GoogleFonts.urbanist(
                fontSize: 12,
              ),),
            ],
          ),
        )
      ],
    );
  }
}
