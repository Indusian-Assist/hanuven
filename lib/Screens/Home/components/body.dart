import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/Screens/Product/product.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constants/images_icons.dart';
import 'components.dart';

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
                  color: Colors.black,
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 10,
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
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Products
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OpenContainer(
                    middleColor: Colors.orange,
                    openColor: Colors.transparent,
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    transitionType: _containerTransitionType,
                    transitionDuration: Duration(milliseconds: 500),
                    closedBuilder: (context, _) => Components.customProductCard(
                        kProduct1Url, 'Product 1', 'INR 300'),
                    openBuilder: (context, _) => ProductScreen(
                      pimage: kProduct1Url,
                      title: 'Product 1',
                      desc:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      price: '300',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OpenContainer(
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    transitionType: _containerTransitionType,
                    transitionDuration: Duration(milliseconds: 500),
                    closedBuilder: (context, _) => Components.customProductCard(
                        kProduct2Url, 'Product 2', 'INR 500'),
                    openBuilder: (context, _) => ProductScreen(
                      pimage: kProduct2Url,
                      title: 'Product 2',
                      desc:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      price: '500',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
