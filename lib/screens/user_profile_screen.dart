import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/edit_profile.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../providers/user.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _userInfoTitle  = TextStyle(color: Colors.grey, fontSize: 14);
  final _userInfoValue  = TextStyle(color: Colors.black,  fontSize: 14);
  var _userdata         = User(userId: '', userName: '',fullName: '', email: '', password: '', phone: null, gender: '', dateOfBird: null, address: '',imageUrl: '');
  var _isInit           = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_isInit){
      _userdata = Provider.of<UserData>(context).getUserProfile();
     
    }

    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
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
                          height: deviceSize.height * 0.9,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/background-profile.jpg'),
                              fit: BoxFit.fitHeight 
                            )
                          )
                        ),
                        Card(
                          elevation: 10,
                          margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
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
                                  child: _userdata.imageUrl != null ?
                                   CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(_userdata.imageUrl),
                                  )
                                  :
                                   CircleAvatar(
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
                                      Text('${_userdata.userName != null ? _userdata.userName :'Not Set'}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        height: 18.0,
                                        width: 18.0,
                                        child: IconButton(
                                            padding: EdgeInsets.all(0.0),
                                            icon: Icon(Icons.open_in_new, size: 18.0, color: Colors.grey),
                                            onPressed: (){
                                              Navigator.of(context).pushNamed(EditProfile.routeName);
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
                                      _profileDetail(context, 'Full Name', '${_userdata.fullName != null ? _userdata.fullName : '-'}'),
                                      Divider(),
                                       _profileDetail(context, 'E-mail', '${_userdata.email != null ? _userdata.email : '-'}'),
                                      Divider(),
                                       _profileDetail(context, 'Phone', '${_userdata.phone != null ? _userdata.phone : '-'}'),
                                      Divider(),
                                       _profileDetail(context, 'Gender', '${_userdata.gender != null ? _userdata.gender : '-'}'),
                                      Divider(),
                                       _profileDetail(context, 'Date Of Bird', '${_userdata.dateOfBird != null ? _userdata.dateOfBird : '-'}'),
                                      Divider(),
                                       _profileDetail(context, 'Address', '${_userdata.address != null ? _userdata.address : '-'}'),
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
