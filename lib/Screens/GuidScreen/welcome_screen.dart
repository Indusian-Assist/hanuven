import 'package:flutter/material.dart';
import 'package:hanuven/Screens/GuidScreen/Components/welcome_body.dart';
import 'package:hanuven/Screens/loginScreen/login_screen.dart';
import 'package:hanuven/utils/constants/color.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key, required this.onPressed});
  Function() onPressed;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool navigate = false;

  @override
  Widget build(BuildContext context) {
    return navigate
        ? LoginScreen(
            onPressed: widget.onPressed,
          )
        : Scaffold(
            backgroundColor: kBackgroundColor,
            body: WelcomeBody(onPressed: () {
              setState(() {
                navigate = true;
              });
            }));
  }
}
