import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/color.dart';
import '../../../api/models/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skeletons/skeletons.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});
  final spinkit = const SpinKitFadingCircle(
    color: kButtonColor,
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SkeletonTheme(
      // themeMode: ThemeMode.light,
      shimmerGradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 81, 134, 225),
          Color.fromARGB(255, 129, 170, 251),
          Color.fromARGB(255, 142, 171, 238),
        ],
        stops: [
          0.1,
          0.5,
          0.9,
        ],
      ),
      darkShimmerGradient: const LinearGradient(
        colors: [
          Color(0xFF222222),
          Color(0xFF242424),
          Color(0xFF2B2B2B),
          Color(0xFF242424),
          Color(0xFF222222),
        ],
        stops: [
          0.0,
          0.2,
          0.5,
          0.8,
          1,
        ],
        begin: Alignment(-2.4, -0.2),
        end: Alignment(2.4, 0.2),
        tileMode: TileMode.clamp,
      ),
      child: FutureBuilder<dynamic>(
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.01),
                child: Column(
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: size.width * 0.3,
                        height: size.height * 0.3,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                        lines: 2,
                        spacing: 10,
                      ),
                    ),
                    SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                        lines: 2,
                        spacing: 10,
                      ),
                    ),
                    SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                        lines: 2,
                        spacing: 10,
                      ),
                    ),
                    // SizedBox(height: size.height*0),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: size.width * 0.0,
                        height: size.height * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
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
                      margin: const EdgeInsets.all(2.0),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://ui-avatars.com/api/?background=0D8ABC&color=fff&name=${userData.name ?? 'Not Any'}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userData.name ?? 'Name NA',
                            style: GoogleFonts.urbanist(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          // IconButton(
                          //   padding: const EdgeInsets.all(0.0),
                          //   icon: const Icon(Icons.edit_document),
                          //   onPressed: () {
                          //     Navigator.pushNamed(context, '/home');
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 3.0),
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 234, 239),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        {userData.role ?? 'Role'}.toString().toUpperCase(),
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kButtonColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 3.0),
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.pin_drop),
                          Text(userData.address ?? 'Address'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Email : ${userData.email ?? "NA"} \nPhone : ${userData.phone} \nDateTime : ${userData.loginInfo?.date ?? "NA"} \nIP : ${userData.loginInfo?.ip ?? "NA" } \nDevice : ${userData.loginInfo?.device ?? "NA"} \nHeader : ${userData.loginInfo?.header ?? "NA"}',
                  style: GoogleFonts.urbanist(
                    fontSize: 12,
                  ),
                ),

                // Scanned Products
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kGreyColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
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
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
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
      ),
    );
  }
}
