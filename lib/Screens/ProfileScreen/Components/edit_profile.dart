import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:hanuven/utils/constants/images_icons.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Container(
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: CustomClipPath(),
                      child: Container(
                        height: size.height / 4,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: kProfileBgImage, fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.bottomRight,
                      height: size.height / 4,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                          color: kBackgroundColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            //Todo: Perform an action to edit background image
                          },
                          icon: Icon(Icons.image),
                          color: kDarkColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: kBackgroundColor.withOpacity(0.5),
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
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/home');
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
                      height: 90,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(2.0),
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                      image: kProfileImage,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 150,
                                width: 150,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kBackgroundColor.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      //Todo: perform an action to edit profile image
                                    },
                                    icon: Icon(Icons.edit),
                                    color: kDarkColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Form(
                        key: formKey,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //name
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Name',
                                    labelText: 'Name',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //location
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Location',
                                    labelText: 'Location',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //type of customer
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Type',
                                    labelText: 'Type',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'About',
                                      labelText: 'About',
                                      hintMaxLines: 5,
                                      alignLabelWithHint: true),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //Todo: Tanishk
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
                              'SAVE DETAILS',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    var firstStart = Offset(w / 4, h);
    var firstEnd = Offset(w / 3, h - h / 6);

    var secondStart = Offset(w / 2, h / 2);
    var secondEnd = Offset(w * (2 / 3), h - h / 6);

    var thirdStart = Offset(w * (3 / 4), h);
    var thirdEnd = Offset(w * (10 / 12), h);

    path.moveTo(0, 0); // 1. Point
    path.lineTo(0, h); // 2. Point
    path.lineTo(w / 6, h); // 3. Point
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy); //4,5. Point
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx,
        secondEnd.dy); //6,7. Point
    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy); //8,9. Point
    path.lineTo(w, h); //10. Point
    path.lineTo(w, 0); // 11. Point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
