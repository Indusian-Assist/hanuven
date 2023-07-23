// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanuven/api/Manager/dialog_manager.dart';
import 'package:hanuven/api/Manager/session_token_manager.dart';

import 'package:hanuven/utils/constants/color.dart';

import 'package:hanuven/utils/constants/text_styles.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../api/controller/login_logic.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.number, required this.onPressed});
  String number;
  Function() onPressed;

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
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        color: kBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Image(
                    image: AssetImage('assets/images/otpscreen.png'),
                    height: 150,
                    width: 150),
                Text(
                  'Enter OTP \nto verify',
                  style: kDefaultFontLogin,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpTimerButton(
                  textColor: kDarkColor,
                  height: 60,
                  onPressed: () {},
                  text: const Text(
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
                    var response = await verifyOTP(widget.number, "123456");
                    debugPrint(response);
                    if (response == '{"url":"https://hanuven.vercel.app"}') {
                      DialogManager.customSnackBar(
                          context,
                          "Successfully Logged In",
                          const Color.fromARGB(149, 2, 109, 54));
                      // Navigator.pushReplacementNamed(context, '/home');
                      widget.onPressed();
                    } else {
                      setState(() {
                        code = '';
                      });
                      DialogManager.customSnackBar(context,
                          await checkErrorMessage(response), Colors.red);
                    }
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

class OTPWidget extends StatelessWidget {
  const OTPWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/otpscreen.png'),
            height: 150,
            width: 150,
          ),
          const Text(
            'Enter Your \nOTP',
            maxLines: 2,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'We have sent you an OTP on your \nregistered mobile number',
            maxLines: 2,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
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
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
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
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
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
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
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
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
