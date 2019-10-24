import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import '../screens/favorite_screen.dart';
import '../screens/home_screen.dart';
import '../screens/order_screen.dart';
import '../screens/user_profile_screen.dart';

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  int selectedPos                     = 0;
  double bottomNavBarHeight           = 60;
  static const  _labelBottomBarStyle  = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
  List<TabItem> tabItems              = List.of([
                  new TabItem(Icons.home, "Home", Colors.yellow[50], labelStyle: _labelBottomBarStyle),
                  new TabItem(Icons.favorite, "Favorites", Colors.yellow[50], labelStyle: _labelBottomBarStyle),
                  new TabItem(Icons.swap_horiz, "Orders", Colors.yellow[50], labelStyle: _labelBottomBarStyle),
                  new TabItem(Icons.person, "Profile", Colors.yellow[50], labelStyle: _labelBottomBarStyle),
                ]);


  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    var _page;
    Color selectedColor = tabItems[selectedPos].circleColor;
    switch (selectedPos) {
      case 0:
        _page = HomeScreen();
        break;
      case 1:
         _page = FavoritesScreen();
        break;
      case 2:
         _page = OrderScreen();
        break;
      case 3:
         _page = UserProfileScreen();
        break;
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: _page,
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.amber,
      animationDuration: Duration(milliseconds: 800),
      selectedIconColor: Colors.cyan[900],
      normalIconColor: Colors.white,
      circleStrokeWidth: 3,
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          // print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}