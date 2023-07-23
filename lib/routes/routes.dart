import 'package:flutter/material.dart';
import 'package:hanuven/Screens/GuidScreen/welcome_screen.dart';
import 'package:hanuven/Screens/Home/home_screen.dart';
import 'package:hanuven/Screens/ProfileScreen/Components/edit_profile.dart';
import 'package:hanuven/Screens/ProfileScreen/profile_screen.dart';
import 'package:hanuven/Screens/Shopping/thankyou.dart';
import 'package:hanuven/Screens/loginScreen/login_screen.dart';
import 'package:hanuven/utils/Components/animations/error.dart';
import '../Screens/Scanner/components/qr_scan.dart';
import '../Screens/Scanner/components/scan_result.dart';
import '../utils/Components/animations/success.dart';
import '../utils/Components/custom_page_route.dart';
import '../Screens/Splash/splash_screen.dart';
import '../Screens/test.dart';

onGenerateInitialRoutes(String initialRoute) {
  return [
    MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: '/home'),
    ),
  ];
}

onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/test':
      return CustomPageRoute(
          child: TestScreen(),
          settings: settings,
          direction: AxisDirection.left);
    // case '/splash':
    //   return MaterialPageRoute(
    //       builder: (context) => const SplashScreen(), settings: settings);
    case '/home':
      return CustomPageRoute(
          child: const HomeScreen(),
          settings: settings,
          direction: AxisDirection.left);
    // case '/guid':
    //   return CustomPageRoute(
    //       child: const WelcomeScreen(),
    //       settings: settings,
    //       direction: AxisDirection.left);
    // case '/login':
    //   return CustomPageRoute(
    //       child: const LoginScreen(),
    //       settings: settings,
    //       direction: AxisDirection.right);
    case '/ScanQR':
      return CustomPageRoute(
          child: const QRScanner(),
          settings: settings,
          direction: AxisDirection.left);
    case '/scanResult':
      return CustomPageRoute(
          child: ResultScreen(closeScreen: () {}, code: ''),
          settings: settings,
          direction: AxisDirection.up);
    case '/success':
      return CustomPageRoute(
          child: const SuccessScreen(),
          settings: settings,
          direction: AxisDirection.up);
    case '/error':
      return CustomPageRoute(
          child: const ErrorScreen(),
          settings: settings,
          direction: AxisDirection.up);
    case '/editprofile':
      return CustomPageRoute(
          child: const EditProfile(),
          settings: settings,
          direction: AxisDirection.left);
    case '/profile':
      return CustomPageRoute(
          child: const ProfileScreen(),
          settings: settings,
          direction: AxisDirection.left);
    case '/thankyou':
      return CustomPageRoute(
          child: const Thankyou(),
          settings: settings,
          direction: AxisDirection.left);
  }
}
