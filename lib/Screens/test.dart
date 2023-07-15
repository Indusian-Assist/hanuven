import 'package:flutter/material.dart';
import '../api/models/user.dart'; // Replace with the correct import path

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
          future: fetchUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              UserData userData = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${userData.name}'),
                  Text('Email: ${userData.email}'),
                  // Display other fields as desired
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
