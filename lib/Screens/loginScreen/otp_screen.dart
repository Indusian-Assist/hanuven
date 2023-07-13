import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hanuven/utils/constants/color.dart';

import 'package:hanuven/utils/constants/text_styles.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../api/controller/login_logic.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.number});
  final String number;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        color: kBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Image(
                      image: AssetImage('assets/images/otpscreen.png'),
                      height: 150,
                      width: 150),
                  Text(
                    'Enter OTP \nto verify',
                    style: kDefaultFontLogin,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                      child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomOTPField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              code = code + value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        CustomOTPField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              code = code + value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        CustomOTPField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              code = code + value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        CustomOTPField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              code = code + value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        CustomOTPField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              code = code + value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        CustomOTPField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              code = code + value;
                              // AuthenticationRepository.instance.verifyOTP(context, code);
                            }
                          },
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpTimerButton(
                  textColor: kDarkColor,
                  height: 60,
                  onPressed: () {},
                  text: Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: 20),
                  ),
                  buttonType: ButtonType.text_button,
                  backgroundColor: kButtonColor,
                  duration: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    formKey.currentState?.save();
                    debugPrint(code);
                    var response = await verifyOTP(widget.number, code);
                    debugPrint(response);
                    if (response == '{"url":"https://hanuven.vercel.app"}') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Successfully Logged In"),
                        ),
                      );
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid OTP'),
                        ),
                      );
                    }
                    // AuthenticationRepository.instance.verifyOTP(context, code);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kDarkColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_right_alt,
                        size: 35,
                        color: kLightColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomOTPField extends StatelessWidget {
  const CustomOTPField({
    super.key,
    required this.onChanged,
  });
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        onChanged: onChanged,

        decoration:
            const InputDecoration(hintText: "0", border: OutlineInputBorder()),
        //style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

class otpwidget extends StatelessWidget {
  const otpwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kBackgroundColor,
        child: Column(children: [
          Image(
            image: AssetImage('assets/images/otpscreen.png'),
            height: 150,
            width: 150,
          ),
          Text(
            'Enter Your \nOTP',
            maxLines: 2,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'We have sent you an OTP on your \nregistered mobile number',
            maxLines: 2,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: kGreyColor,
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: kGreyColor,
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: kGreyColor,
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: kGreyColor,
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
