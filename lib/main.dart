import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/auth_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Swatch Shop',
        theme: ThemeData(
          primaryColor: Colors.yellow[50],
          accentColor: Colors.grey.withOpacity(0.1),
          textTheme: TextTheme(
            headline: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            title: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            body1: TextStyle(
              fontSize: 12,
            ),
          )
        ),
        home: AuthScreen(),
    ),
    );
  }
}