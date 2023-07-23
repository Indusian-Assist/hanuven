// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hanuven/api/controller/login_logic.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:hanuven/utils/constants/images_icons.dart';
import 'package:hanuven/utils/constants/text_styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../api/Manager/session_token_manager.dart';
import '../../api/Manager/dialog_manager.dart';
import 'otp_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, required this.onPressed});

  Function() onPressed;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();
  String initialCountry = 'IN';
  String phoneNo = '';
  String optscreenNumber = '';
  bool isNumberScreen = true;
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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isNumberScreen
        ? Scaffold(
            backgroundColor: kBackgroundColor,
            body: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Image(
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
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    // print(number.phoneNumber.toString());
                                  },
                                  onInputValidated: (bool value) {
                                    // print(value);
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  selectorTextStyle:
                                      const TextStyle(color: kDarkColor),
                                  initialValue: number,
                                  textFieldController: _controller,
                                  formatInput: true,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                  searchBoxDecoration: const InputDecoration(
                                      fillColor: kDarkGreyColor),
                                  onSaved: (PhoneNumber number) {
                                    setState(() {
                                      this.number = number;
                                      phoneNo = number.phoneNumber.toString();
                                    });
                                    debugPrint('On Saved: $number');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: RichText(
                              text: const TextSpan(children: <TextSpan>[
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
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            //! Login Logic ----------->>>>>>>>>
                            formKey.currentState?.save();
                            var number = phoneNo.split('+91')[1];
                            var error =
                                await checkErrorMessage(await login(number));
                            var appSignature = await SmsAutoFill()
                                .getAppSignature; // Get App Signature
                            if (formKey.currentState!.validate()) {
                              Map data = {
                                'phone': number,
                                'appSignature': appSignature,
                              };
                              debugPrint(data.toString());
                              DialogManager.customSnackBar(context, error,
                                  const Color.fromARGB(255, 54, 149, 244));

                              setState(() {
                                isNumberScreen = false;
                                optscreenNumber = number;
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => OTPScreen(
                              //       number: number,
                              //     ),
                              //   ),
                              // );
                            } else {
                              DialogManager.customSnackBar(context, error,
                                  const Color.fromARGB(255, 244, 54, 54));
                            }
                            //! Till here ---------------->>>>>>>>>>
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: kDarkColor,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_right_alt,
                                size: 35,
                                color: kLightColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : OTPScreen(
            number: optscreenNumber,
            onPressed: widget.onPressed,
          );
  }
}
