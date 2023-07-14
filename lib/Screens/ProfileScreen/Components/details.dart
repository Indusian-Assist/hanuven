import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:hanuven/utils/constants/images_icons.dart';
import '../../../api/models/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({super.key});
  final spinkit = SpinKitFadingCircle(
    color: kButtonColor,
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: spinkit,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          UserData userData = snapshot.data;
          return Column(
      children: [
        Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(2.0),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: kProfileImage, fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userData.name,
                            style: GoogleFonts.urbanist(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0.0),
                            icon: Icon(Icons.edit_document),
                            onPressed: () {
                              Navigator.pushNamed(context, '/editprofile');
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 3.0),
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      width: 100,
                      child: Text(
                        userData.role.toUpperCase(),
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kButtonColor,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 229, 234, 239),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 3.0),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.pin_drop),
                          Text(userData.address),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Login Info'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.urbanist(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Email : ${userData.email} \nPhone : ${userData.phone} \nDateTime : ${userData.loginInfo.date} \nIP : ${userData.loginInfo.ip} \nDevice : ${userData.loginInfo.device} \nHeader : ${userData.loginInfo.header}',
                  style: GoogleFonts.urbanist(
                    fontSize: 12,
                  ),
                ),

                // Scanned Products
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
                          border: Border.all(width: 1, color: kGreyColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: kGreyColor,
                            ),
                            Text(
                              'Product1',
                              style: GoogleFonts.urbanist(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Todo: Srijan perform a action
                      },
                      child: Container(
                        height: 50,
                        width: 280,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kButtonColor,
                        ),
                        child: Text(
                          'ORDER DETAILS',
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kLightColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      ],
    );
        }
      },
    );
}
}