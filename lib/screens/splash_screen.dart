import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/auth_screens.dart';
import '../screens/overview_screen.dart';
import '../providers/auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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