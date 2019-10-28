import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';
import '../providers/cart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin {
  TabController _controller;
  var _categories   = 'men';
  

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  void _setCatgories(int index){
    var value = '';
    if(index == 0 ){
        value = 'men';
    } else if (index == 1){
        value = 'women';
    } else {
        value = 'sliper';
    }

    setState(() {
      _categories = value;
    });
  }

  @override
  Widget build(BuildContext context) {
  final deviceSize = MediaQuery.of(context).size; 
   return Scaffold(
     appBar: AppBar(
       title: Text('Featured'),
       backgroundColor: Colors.white,
      actions: <Widget>[
        Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
            child: ch,
            value: cart.cartCount.toString(),
          ),
          child: IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.amber  ),
            onPressed: (){
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          )

        )
      ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            //slider
            Container(
              child: SizedBox(
                  height: deviceSize.height * 0.25,
                  width: double.infinity,
                  child: Carousel(
                    images: [
                      new NetworkImage(
                          'https://brathwait.imgix.net/images/JM_BRATHWAIT-0067.jpeg?auto=compress%2Cformat&crop=focalpoint&fit=crop&fm=jpg&fp-x=0.5&fp-y=0.5&h=800&ixlib=php-1.1.0&q=90&w=800&s=fdfa21825408a789687016a10e6c2f9f'),
                      new NetworkImage(
                          'https://brathwait.imgix.net/images/classic-womens-wristwatch-mesh.jpg?auto=compress%2Cformat&crop=focalpoint&fit=crop&fm=jpg&fp-x=0.521&fp-y=0.447&h=800&ixlib=php-1.1.0&q=90&w=800&s=8c6410a319bb042e736c8fcec14c7a3d'),
                      new NetworkImage(
                          'https://s3.amazonaws.com/brathwait-com/transformed/02c686d5d4/photos/143085415/xl/63bb7b933dbe76cbaee3_85eb83ecd914a01fda67b892449096e1.jpg'),
                      new NetworkImage(
                          'https://brathwait.imgix.net/images/the-swiss-classic-front-green.jpg?auto=compress%2Cformat&crop=focalpoint&fit=crop&fm=jpg&fp-x=0.4685&fp-y=0.2971&h=1875&ixlib=php-1.1.0&q=90&sharp=0&w=1200&s=bbc9779c8df183013361f3e805060e73'),
                    ],
                    showIndicator: true,
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.yellow,
                    borderRadius: false,
                    dotPosition: DotPosition.bottomLeft,
                    dotBgColor: Colors.transparent,
                    moveIndicatorFromBottom: 180.0,
                    noRadiusForIndicator: false,
                    overlayShadow: true,
                    overlayShadowColors: Colors.black,
                    overlayShadowSize: 0.8,
                ),
              ),
            ),

            // tab category
            Container(
                height: 50,
                decoration:  BoxDecoration(color: Colors.white),
                child:  TabBar(
                  controller: _controller,
                  onTap: (index){
                  
                    _setCatgories(index);

                  },
                  indicatorColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Men`s',
                    ),
                    Tab(
                      text: 'Women`s',
                    ),
                    Tab(
                      text: 'Sliper`s',
                    ),
                  ],
                ),
              ), 
            
            // tab bar
            Container(
              height: deviceSize.height * 0.48,
              padding: EdgeInsets.all(5),
              child:  TabBarView(
                controller: _controller,
                children: <Widget>[
                  Container(
                      child: ProductGrid(_categories)
                  ),
                   Container(
                      child: ProductGrid(_categories)
                  ),
                  Container(
                      child: ProductGrid(_categories)
                  ),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}