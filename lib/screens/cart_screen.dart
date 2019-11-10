import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';
import '../widgets/cart_list.dart';
import '../providers/cart.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart-screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double _courierValue  = 12.000;
  int _courierType      = 0;
  var _userdata         = User(userId: '', userName: '',fullName: '', email: '', password: '', phone: null, gender: '', dateOfBird: null, address: '',imageUrl: null);
  var _isInit           = true;
  void _handleRadioCourierValue(int value) {
    setState(() {
      _courierType = value;
  
      switch (_courierType) {
        case 0:
          _courierValue = 12.000;
          break;
        case 1:
          _courierValue = 14.000;
          break;
        case 2:
          _courierValue = 15.000;
          break;
      }
    });
  }

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
    double  _height;
    final deviceSice  = MediaQuery.of(context).size;
    final cart        = Provider.of<Cart>(context, listen: false);
    final totalCart   = cart.cartCount;
    switch (totalCart){
      case 0:
        _height = 0.0;
        break;
      case 1:
        _height = 0.12;
        break;
      case 2:
        _height = 0.22;
        break;
      case 3:
        _height = 0.32;
        break;

      default:
        _height = 0.45;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Cart', style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.amber,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //for list cart
              totalCart != 0 ? 
              Container(
                height: deviceSice.height * _height,
                child: CartList(),
              )
              :
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('Cart is empty...!', style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), 
              ),
              //for courier
              SizedBox(height: 10),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text('Courier', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[

                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.asset('assets/images/J&T.png', width: 50),
                                      SizedBox(width: 10),
                                      RichText(
                                        text: TextSpan(
                                          text: 'JNE REG ',
                                          style: TextStyle(fontSize: 14, color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(text: '\nRp. 12.000 (3 Hari Kerja)', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Radio(
                                    value: 0,
                                    activeColor: Colors.amber,
                                    groupValue: _courierType,
                                    onChanged: _handleRadioCourierValue,
                                  ),
                             
                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.asset('assets/images/JNE.png', width: 50),
                                      SizedBox(width: 10),
                                      RichText(
                                        text: TextSpan(
                                          text: 'J&T REG ',
                                          style: TextStyle(fontSize: 14, color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(text: '\nRp. 14.000 (2 Hari Kerja)', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Radio(
                                    value: 1,
                                    activeColor: Colors.amber,
                                    groupValue: _courierType,
                                    onChanged: _handleRadioCourierValue,
                                  ),
                             
                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.asset('assets/images/SiCepat.png', width: 50),
                                      SizedBox(width: 10),
                                      RichText(
                                        text: TextSpan(
                                          text: 'SiCepat',
                                          style: TextStyle(fontSize: 14, color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(text: '\nRp. 15.000 (1 Hari Kerja)', style: TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Radio(
                                    value: 2,
                                    activeColor: Colors.amber,
                                    groupValue: _courierType,
                                    onChanged: _handleRadioCourierValue,
                                  ),
                             
                               ],
                             )
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
              //for address customer
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text('Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text('${_userdata.address}', style: TextStyle(fontSize: 14)),
                      )

                    ],
                  ),
                ),
              ),
              //for total orders
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Shipping', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                                Text('Rp. ${_courierValue}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Sub Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                                Text('Rp. ${cart.subTotal}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                                Text('Rp. ${totalCart != 0 ? cart.subTotal + _courierValue : 0}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                              ],
                            )

                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
              //for button order
              ButtonTheme(
                minWidth: deviceSice.width * 0.9,
                height: 45.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                  ),
                  color: Colors.amber,
                  onPressed: totalCart == 0 ? null : () {},
                  child: Text("Order", style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(height: 4),
            ],
          ),
        ) 
    );
  }
}