// Main entry point of the application
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hanuven/firebase_options.dart';
import 'package:hanuven/utils/Auth/authentication_repository.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hanuven',
      theme: ThemeData(
        primarySwatch: kPrimarySwatch,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      onGenerateInitialRoutes: (initialRoute) =>
          onGenerateInitialRoutes(initialRoute),
    );
  }
}
