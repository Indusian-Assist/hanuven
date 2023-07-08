import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/Screens/Home/components/products.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constants/images_icons.dart';


class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ContainerTransitionType _containerTransitionType =
        ContainerTransitionType.fade;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          children: [
            Container(
              height: 125,
              child: Lottie.asset(
                'assets/animations/scanqr1.json',
                fit: BoxFit.cover,
                reverse: true,
                repeat: true,
              ),
            ),
            //scanner button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
              child: Container(
                height: 60,
                width: 280,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(50),
                  color: kDarkColor,
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 10,
                      color: kShadowColor,
                    )
                  ],
                ),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kDarkColor,
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
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Products
            ProductsSection(containerTransitionType: _containerTransitionType)
          ],
        ),
      ),
    );
  }
}

