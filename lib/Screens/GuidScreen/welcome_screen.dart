import 'package:flutter/material.dart';
import 'package:hanuven/Screens/GuidScreen/Components/welcome_body.dart';
import 'package:hanuven/utils/constants/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body:  WelcomeBody()
    );
  }
}
