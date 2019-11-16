import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
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
  final String status;
  final String creatorId;

  OrderItem({
    @required this.orderId,
    @required this.amount,
    @required this.subTotal,
    @required this.shippingAmount,
    @required this.courierName,
    @required this.products,
    @required this.dateTime,
    @required this.status,
    @required this.creatorId,
  });
}

class Orders with ChangeNotifier {
  final String _userId;
  final String _authToken;
  List<OrderItem> _orders = [];

  Orders(this._userId, this._authToken, this._orders);

  List<OrderItem> get order {
    return [..._orders];
  }

  Future<void> fetchAndSetOrder() async {
    final url               = 'https://swatch-shop.firebaseio.com/orders.json?auth=$_authToken&orderBy="creatorId"&equalTo="$_userId"';
    try{

      final response    = await http.get(url);
      final responseData= json.decode(response.body) as Map<String, dynamic>;
      final List<OrderItem> loadedOrders = [];
      if(responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }
      responseData.forEach((orderId, orderData){
        loadedOrders.add(OrderItem(
          orderId: orderData['orderId'],
          shippingAmount: orderData['shippingAmount'],
          subTotal: orderData['subTotal'],
          amount: orderData['total'],
          courierName: orderData['courier'],
          dateTime: DateTime.parse(orderData['dateTime']),
          status: orderData['status'],
          creatorId: orderData['creatorId'],
          products: (orderData['cart'] as List<dynamic>).map((order)=>
            CartItem(
             product_id: order['product_id'],
             product_image: order['product_image'],
             product_name: order['product_name'],
             product_price: order['product_price'],
             quantity: order['quantity'] 
            )
          ).toList()
        ));
      });

       _orders = loadedOrders.reversed.toList();
        notifyListeners();
    } catch (err){
      throw err;
    }

  }

  Future<void> addOrder(List<CartItem> cart, double total, double shippingAmount, String courierName, double subTotal ) async {
    var random              = Random.secure();
    var randoms             = random.nextInt(1000000000);
    final generateOrderCode = 'swatch#${randoms}';
    final url               = 'https://swatch-shop.firebaseio.com/orders.json?auth=$_authToken';

    try{
      
      final response = await http.post(
        url,
        body: json.encode({
          'orderId' : generateOrderCode,
          'subTotal': subTotal,
          'shippingAmount': shippingAmount,
          'courier': courierName,
          'total' : total,
          'dateTime': DateTime.now().toIso8601String(),
          'status': 'processing',
          'creatorId': _userId,
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
        products: cart,
        creatorId: _userId,
        status: 'processing',
      ));

      notifyListeners();
  }

  List<OrderItem> findByStatus(String status){
    return _orders.where( (orderItem) => orderItem.status == status ).toList();
  } 
}