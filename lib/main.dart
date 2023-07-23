// Main entry point of the application
import 'package:flutter/material.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'Screens/GuidScreen/welcome_screen.dart';
import 'Screens/Splash/splash_screen.dart';
import 'api/Manager/session_token_manager.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  runApp(MyApp(
    navigatorKey: navigatorKey,
  ));
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  MyApp({required this.navigatorKey});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // checkUser()
  Future condition = checkUser();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hanuven',
      theme: ThemeData(
        primarySwatch: kPrimarySwatch,
      ),
      navigatorKey: widget.navigatorKey, // Pass the navigatorKey here
      builder: (contexts, child) {
        return FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == true) {
                return Scaffold(body: child);
              } else {
                return WelcomeScreen(
                  onPressed: () {
                    debugPrint('pressed');
                    // setState(() {
                    //   condition = Future(() async {
                    //     return true;
                    //   });
                    // });
                  },
                );
              }
            } else {
              return SplashScreen();
            }
          },
          future: condition,
        );
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      onGenerateInitialRoutes: (initialRoute) =>
          onGenerateInitialRoutes(initialRoute),
    );

    return MaterialApp(
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
