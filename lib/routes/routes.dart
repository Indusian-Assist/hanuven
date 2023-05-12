import 'package:flutter/material.dart';
import 'package:hanuven/Screens/GuidScreen/welcome_screen.dart';
import 'package:hanuven/Screens/loginScreen/login_screen.dart';
import '../utils/Components/custom_page_route.dart';
import '../Screens/Splash/splash_screen.dart';

onGenerateInitialRoutes(String initialRoute) {
  return [
    MaterialPageRoute(
      builder: (context) => const SplashScreen(),
      settings: const RouteSettings(name: '/splash'),
    ),
  ];
}

onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/splash':
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(), settings: settings);
    case '/home':
      return CustomPageRoute(
          child: const WelcomeScreen(),
          settings: settings,
          direction: AxisDirection.left);
    case '/guid':
      return CustomPageRoute(
          child: const WelcomeScreen(),
          settings: settings,
          direction: AxisDirection.left);
    case '/login':
      return CustomPageRoute(
          child: const LoginScreen(),
          settings: settings,
          direction: AxisDirection.left);
  }
}
