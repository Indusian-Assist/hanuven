import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:hanuven/utils/constants/images_icons.dart';
import 'package:hanuven/utils/constants/text_styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'Componets/custom_numberfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
                              // decoration: BoxDecoration(
                              //     border: Border.all(width: 1),
                              //     borderRadius: BorderRadius.circular(10)),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  print(number.phoneNumber);
                                },
                                onInputValidated: (bool value) {
                                  print(value);
                                },
                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                ignoreBlank: false,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                selectorTextStyle:
                                    TextStyle(color: Colors.black),
                                initialValue: number,
                                
                                textFieldController: controller,
                                formatInput: true,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true, decimal: true),
                                inputBorder: OutlineInputBorder(  ),
                                searchBoxDecoration: InputDecoration(
                                  fillColor: kDarkGreyColor
                                ),
                                
                                onSaved: (PhoneNumber number) {
                                  print('On Saved: $number');
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
                      onTap: () {
                        formKey.currentState?.save();
                        Navigator.pushReplacementNamed(context, '/home');
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
