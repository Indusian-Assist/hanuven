import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hanuven/api/controller/login.dart';
// import 'package:hanuven/utils/Auth/authentication_repository.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:hanuven/utils/constants/images_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      await checkUser() == true
        ? Navigator.pushReplacementNamed(context, '/home')
        : Navigator.pushReplacementNamed(context, '/guid');
      // AuthenticationRepository.instance.firebaseUser.value == null
      //     ? Navigator.pushReplacementNamed(context, '/guid')
      //     : Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: kSplashGradientColor,
            ),
          ),
          Center(
            child: Image.asset(
              kMainIconUrl,
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}
