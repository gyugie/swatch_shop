import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/splash_screen.dart';
import './screens/overview_screen.dart';
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
      child: Consumer<Auth>(
        builder: (ctx, authData, child) => MaterialApp(
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),
              body1: TextStyle(
                fontSize: 12,
              ),
            )
          ),
          home: authData.isAuth ? OverviewScreen() : FutureBuilder(
            future: authData.tryToAutoLogin(),
            builder: (ctx, authSnapShot) => 
              authSnapShot.connectionState == ConnectionState.waiting ? SplashScreen() : AuthScreen(),
          ),
          routes: {
           
          },
        ),
      ),
    );
  }
}