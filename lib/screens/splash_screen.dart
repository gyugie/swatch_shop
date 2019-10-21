import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 Flexible(
                   child:  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text(
                      'Hi There, Welcome...',
                      style: Theme.of(context).textTheme.headline,
                      softWrap: true,
                    ),
                  ),
                 ),
                ],
              ),
            ),
          )
        ],
      ),  
    );
  }
}