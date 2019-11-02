import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          child: Text('Hi'),
      )
    );
  }
}