import 'package:flutter/material.dart';
import 'package:hanuven/utils/constants/images_icons.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/text_styles.dart';

class RetailerLogin extends StatefulWidget {
  const RetailerLogin({super.key});

  @override
  State<RetailerLogin> createState() => _RetailerLoginState();
}

class _RetailerLoginState extends State<RetailerLogin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Image(
                        image: retailImage,
                        height: 150,
                        width: 150,
                      ),
                      Text(
                        'Retailer Login',
                        style: kDefaultFontLogin,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: formKey,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //username
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Username',
                                  labelText: 'Username',
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //password
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Password',
                                  labelText: 'Password',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: GestureDetector(
                          onTap: () {},
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'By continuing, you agree to our\n',
                                  style: TextStyle(
                                    color: kTextColor,
                                  )),
                              TextSpan(
                                  text: 'Terms of use',
                                  style: TextStyle(
                                    color: kInfoColor,
                                  )),
                              TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    color: kTextColor,
                                  )),
                              TextSpan(
                                  text: 'Privacy policy',
                                  style: TextStyle(
                                    color: kInfoColor,
                                  ))
                            ]),
                          ),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Todo:
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_right_alt,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
