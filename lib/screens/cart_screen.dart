import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swatch_shop/widgets/cart_list.dart';
import '../providers/cart.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart-screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double _result = 0.0;
  int _radioValue = 0;
  
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
  
      switch (_radioValue) {
        case 0:
          _result = 1.1;
          break;
        case 1:
          _result = 1.2;
          break;
        case 2:
          _result = 1.3;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSice  = MediaQuery.of(context).size;
    final cart        = Provider.of<Cart>(context);
    print(cart.cartCount);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart', style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.amber,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //for list cart
              Container(
                height: deviceSice.height * 0.45,
                child: CartList(),
              ),
              SizedBox(height: 10),
              //for courier
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
                                  Text('JNE (Regular - 12.000)', style: TextStyle(fontSize: 14)),
                                  Radio(
                                    value: 0,
                                    activeColor: Colors.amber,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                             
                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                  Text('SiCepat (Regular - 11.500)', style: TextStyle(fontSize: 14)),
                                  Radio(
                                    value: 1,
                                    activeColor: Colors.amber,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                             
                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                  Text('J&T (Regular - 11.000)', style: TextStyle(fontSize: 14)),
                                  Radio(
                                    value: 2,
                                    activeColor: Colors.amber,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
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
                        child: Text('asdasdadsasd\n asdasd', style: TextStyle(fontSize: 14)),
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
                                Text('\$ 100.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Sub Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                                Text('\$ 1000.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                                Text('\$ 1100.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
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
                  onPressed: () {},
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