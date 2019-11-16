import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:swatch_shop/providers/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import '../providers/http_exception.dart';
import '../providers/cart.dart';

class OrderItem {
  final String orderId;
  final double amount;
  final double subTotal;
  final double shippingAmount;
  final String courierName;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.orderId,
    @required this.amount,
    @required this.subTotal,
    @required this.shippingAmount,
    @required this.courierName,
    @required this.products,
    @required this.dateTime
  });
}

class Orders with ChangeNotifier {
  final String _userId;
  final String _authToken;
  List<OrderItem> _orders = [];

  Orders(this._userId, this._authToken);

  List<OrderItem> get order {
    return [..._orders];
  }

  Future<void> fetchAndSetOrder() async {

  }

  Future<void> addOrder(List<CartItem> cart, double total, double shippingAmount, String courierName, double subTotal ) async {
    var random              = Random.secure();
    var randoms             = random.nextInt(1000000000);
    final generateOrderCode = 'swatch#${randoms}';
    final url               = 'https://swatch-shop.firebaseio.com/orders/$_userId.json?auth=$_authToken';

    try{
      
      final response = await http.post(
        url,
        body: json.encode({
          'orderId' : generateOrderCode,
          'subTotal': subTotal,
          'shippingAmount': shippingAmount,
          'courier': courierName,
          'total' : total,
          'cart' : cart.map( (cart)=>{
              'product_id' : cart.product_id,
              'product_name': cart.product_name,
              'product_price': cart.product_price,
              'product_image': cart.product_image,
              'quantity': cart.quantity
          }).toList()
        })
      );

      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }

    }catch (err){
      throw err;
    }

    _orders.insert(
      0, OrderItem(
        orderId: generateOrderCode,
        dateTime: DateTime.now(),
        amount: total,
        shippingAmount: shippingAmount,
        courierName: courierName,
        subTotal: subTotal,
        products: cart
      ));

      notifyListeners();
  }
}