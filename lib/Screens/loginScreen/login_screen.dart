import 'package:flutter/material.dart';
import 'package:hanuven/api/controller/login.dart';
// import 'package:hanuven/utils/Auth/authentication_repository.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:hanuven/utils/constants/images_icons.dart';
import 'package:hanuven/utils/constants/text_styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  String phoneNo = '';
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      image: loginImage,
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      'Enter Your \nPhone Number',
                      maxLines: 2,
                      style: kDefaultFontLogin,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  print(number.phoneNumber.toString());
                                },
                                onInputValidated: (bool value) {
                                  print(value);
                                },
                                selectorConfig: SelectorConfig(
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                ignoreBlank: false,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                selectorTextStyle:
                                    TextStyle(color: Colors.black),
                                initialValue: number,
                                textFieldController: _controller,
                                formatInput: true,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true, decimal: true),
                                inputBorder: OutlineInputBorder(),
                                searchBoxDecoration:
                                    InputDecoration(fillColor: kDarkGreyColor),
                                onSaved: (PhoneNumber number) {
                                  setState(() {
                                    this.number = number;
                                    phoneNo = number.phoneNumber.toString();
                                  });
                                  print('On Saved: ${number}');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // CustomNumberField(),
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
                      onTap: () async {
                        formKey.currentState?.save();
                        var number = phoneNo.split('+91')[1];
                        var val = await login(number);
                        debugPrint(val);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPScreen(
                              number: number,
                            ),
                          ),
                        );
                        //  AuthenticationRepository.instance.phoneAuthentication(
                        //       context, number.phoneNumber.toString());
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
            // ElevatedButton(
            //   onPressed: () => Navigator.pushNamed(context, '/home'),
            //   child: Text('Go to Home Screen'),
            // ),
          ),
        ),
      ),
    );
  }
}
