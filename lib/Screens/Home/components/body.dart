import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/color.dart';

import '../../../utils/constants/images_icons.dart';
import 'components.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  //todo: Srijan add a perform action
                },
              ),
            ),
            actions: [
              Container(
                child: InkWell(
                  onTap: () {
                    // Todo: Srijan add a perform action
                  },
                  child: Ink.image(
                    image: AssetImage(
                      kMainIconUrl,
                    ),
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
              ),
              //scanner button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
                child: Container(
                  height: 70,
                  width: 280,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        blurRadius: 15,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: kLightColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/ScanQR');
                      },
                      icon: Icon(Icons.qr_code_scanner),
                      label: Text(
                        'SCAN PRODUCTS',
                        style: GoogleFonts.urbanist(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: Image(
                  image: kHomeScreenRingsImage,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              // Header Text
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Text(
                  'Our Products',
                  style: GoogleFonts.urbanist(
                    color: kTextColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Products
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Components.customProductCard(kProduct1Url, 'Product 1',
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                    Components.customProductCard(kProduct2Url, 'Product 2',
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
