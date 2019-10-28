import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';

class UserProfileScreen extends StatelessWidget {
  final _userInfoTitle = TextStyle(color: Colors.grey, fontSize: 14);
  final _userInfoValue = TextStyle(color: Colors.black,  fontSize: 14);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
           SliverAppBar(
            expandedHeight: deviceSize.height * 0.09,
            floating: false,
            pinned: true,
            snap: false,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold),),
            actions: <Widget>[
                Consumer<Cart>(
                  builder: (_, cartData, ch) => Badge(
                    child: ch,
                    value: cartData.cartCount.toString(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.black),
                    onPressed: (){
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  )
                ),
                
              ],
            //  pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(0.0),
                background: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background-profile.jpg'),
                          fit: BoxFit.fitWidth
                        )
                      )
                    ),
                  ],
                )
              ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                // height: deviceSize.height * 0.9,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                      Container(
                          height: deviceSize.height * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/background-profile.jpg'),
                              fit: BoxFit.fitWidth
                            )
                          )
                        ),
                        Card(
                          elevation: 3,
                          margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40), 
                              topRight: Radius.circular(40),
                            )
                          ),
                          child: Column(
                            children: <Widget>[
                              FractionalTranslation(
                                translation: Offset(-0.01, -0.4),
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    child: new Icon(
                                      Icons.person_pin,
                                      color: Colors.grey[350], 
                                      size: 80.0,
                                    ), 
                                  ),
                                )
                              ),
                              FractionalTranslation(
                                translation: Offset(0, -1.5),
                                child:  Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Gyugie', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        height: 18.0,
                                        width: 18.0,
                                        child: IconButton(
                                            padding: EdgeInsets.all(0.0),
                                            icon: Icon(Icons.open_in_new, size: 18.0, color: Colors.grey),
                                            onPressed: (){
                                              print('object');
                                            },
                                        )
                                      )
                                    ],
                                  )
                                )
                              ),
                              Container(
                                  height: deviceSize.height * 0.35,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    children: <Widget>[
                                      _profileDetail(context, 'Full Name', 'Mugiono Arif S'),
                                      Divider(),
                                       _profileDetail(context, 'E-mail', 'mugypleci@gmail.com'),
                                      Divider(),
                                       _profileDetail(context, 'Gender', 'Male'),
                                      Divider(),
                                       _profileDetail(context, 'Date Of Bird', '1994/03/26'),
                                      Divider(),
                                       _profileDetail(context, 'Address', 'Jl. Naggrog 3 RT04/09 no.144, kelurahan pasir jati kecamatan Ujungberung Bandung, Kota Bandung'),
                                      Divider(),

                                    ],
                                  ),
                              ),
                            ],
                          )
                        ),
                    
                    ])
                  ],
                )
              ),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.favorite_border, color: Colors.grey, size: 30),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text('Product Favorites'),
                    subtitle: Text('Buy youre collected product'),
                    onTap: (){

                    },
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.favorite_border, color: Colors.grey, size: 30),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text('Product Favorites'),
                    subtitle: Text('Buy youre collected product'),
                    onTap: (){

                    },
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.favorite_border, color: Colors.grey, size: 30),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text('Product Favorites'),
                    subtitle: Text('Buy youre collected product'),
                    onTap: (){

                    },
                  )
                ),
              ),
              
            ]),
          ),
        ],
      )
    );
  }

  Widget _profileDetail(BuildContext context, String title, String value){
  final deviceSize = MediaQuery.of(context).size;
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: <Widget>[
       Text('${title}', style: _userInfoTitle),
       Container(
        padding: EdgeInsets.only(left: 5),
        width: deviceSize.width * 0.4,
        child: Text('${value}', style: _userInfoValue),
      ),
     ],
   );
  }
}
