import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/overview_screen.dart';
import '../screens/auth_screens.dart';
import '../providers/auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  var _isInit = true;
  var cachedSession = false;

  
  void checkingUserSession(){
   _timer = Timer(Duration(seconds: 2), (){
  //     var userAuth = Provider.of<Auth>(context, listen: false); 
  //       userAuth.isAuth ?   
  //         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  //         OverviewScreen()), (Route<dynamic> route) => false)
  //       :  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  //         AuthScreen()), (Route<dynamic> route) => false);
  //  print(userAuth.isAuth);
   });
  }

  @override
  Widget build(BuildContext context) {
    checkingUserSession();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}