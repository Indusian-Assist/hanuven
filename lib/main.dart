// Main entry point of the application
import 'package:flutter/material.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hanuven',
      theme: ThemeData(
        primarySwatch: kPrimarySwatch,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      onGenerateInitialRoutes: (initialRoute) => onGenerateInitialRoutes(initialRoute),
    );
  }
}
