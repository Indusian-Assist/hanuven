import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Login Screen'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Text('Go to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
