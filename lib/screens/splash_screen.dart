import 'package:flutter/material.dart';
import 'dart:async';
import '../screens/overview_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, () {
        return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          child: null,
      )
    );
  }
}