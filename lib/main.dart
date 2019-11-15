import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/orders.dart';
import './providers/user.dart';
import './widgets/edit_profile.dart';
import './screens/cart_screen.dart';
import './providers/cart.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
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
        ),
        ChangeNotifierProxyProvider<Auth, UserData>(
          builder: (ctx, authData, cachedUser) => UserData(
            authData.userId,
            authData.token,
            cachedUser == null ? [] : cachedUser.user
          ), initialBuilder: (BuildContext context) {},
        ),
        ChangeNotifierProvider.value(
          value: Products()
        ),
         ChangeNotifierProvider.value(
          value: Cart()
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          builder: (ctx, auth, cachedOrders) => Orders(
            auth.userId,
            auth.token
          ), initialBuilder: (BuildContext context) {return;},
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
          home:// SplashScreen(),
          authData.isAuth ? OverviewScreen() : FutureBuilder(
            future: authData.tryToAutoLogin(),
            builder: (ctx, authSnapShot) => 
              authSnapShot.connectionState == ConnectionState.waiting ? SplashScreen() : AuthScreen(),
          ),
          routes: {
           ProductDetailScreen.routeName : (ctx) => ProductDetailScreen(),
           CartScreen.routeName : (ctx) => CartScreen(),
           EditProfile.routeName : (ctx) => EditProfile()
          },
        ),
      ),
    );
  }
}