import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/api/controller/login_logic.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/images_icons.dart';

class Components {
  static AppBar customAppBar(context) {
    return AppBar(
      backgroundColor: kTransparentColor,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
        ),
        child: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
              await logout(context);
          },
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
          child: Ink.image(
            image: const AssetImage(
              kMainIconUrl,
            ),
            height: 75,
            width: 75,
          ),
        ),
      ],
    );
  }

  static PreferredSize customPreferredSize(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(75.0),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Components.customAppBar(context),
      ),
    );
  }

  static Container customProductCard(
      String imageUrl, String headertxt, String price, Size size) {
    return Container(
      // height: size.height * 0.31,
      width: size.width * 0.42,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(width: 0),
          borderRadius: BorderRadius.circular(20),
          color: kDarkColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 15,
              spreadRadius: 10,
              color: kShadowColor,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: SizedBox(
                height: 160,
                width: 160,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                headertxt,
                style: const TextStyle(
                  color: kLightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price',
                    style:
                        GoogleFonts.urbanist(color: kLightColor, fontSize: 14),
                  ),
                  Text(
                    price,
                    style:
                        GoogleFonts.urbanist(color: kLightColor, fontSize: 14),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: kTextColor,
                        textStyle: GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                    onPressed: () {
                      //Todo: Srijan add an action
                    },
                    child: const Text('BUY NOW'),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    iconSize: 15,
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      //Todo : Srijan add an action
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
