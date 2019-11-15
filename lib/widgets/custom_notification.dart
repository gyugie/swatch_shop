import 'package:flutter/material.dart';

class CustomNotif{

  static alertDialogWithIcon(BuildContext context, IconData icon, String title, String messages, bool warning){
    showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0)),
            title: Container(
              child: Icon(icon, size: 100, color: warning ? Colors.red : Colors.amber),
            ),
            content:Container(
              height: 150,
              child: Column(
                children: <Widget>[
                  Text(title, style: TextStyle(color: warning ? Colors.red : Colors.amber, fontSize: 24)),
                  SizedBox(height: 20),
                  Text(messages, style: TextStyle(color: Colors.grey, fontSize: 16), textAlign: TextAlign.center,),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Close', style: TextStyle(color: warning ? Colors.red : Colors.amber)),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 500),
    barrierDismissible: false,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {});
  }
}