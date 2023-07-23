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
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          children: [
            SizedBox(
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
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.15, vertical: 10),
              child: Container(
                height: size.height * 0.068,
                width: size.width * 0.8,
                padding: const EdgeInsets.all(8.0),
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
                    icon: const Icon(Icons.qr_code_scanner),
                    label: Text(
                      'SCAN PRODUCTS',
                      style: GoogleFonts.urbanist(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.21,
              width: double.infinity,
              child: Image(
                image: kHomeScreenRingsImage,
                fit: BoxFit.cover,
                height: size.height * 0.21,
              ),
            ),
            // Header Text
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.005, horizontal: size.width * 0.05),
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
