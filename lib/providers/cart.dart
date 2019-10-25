
import 'package:flutter/cupertino.dart';

class CartItem {
  final String product_id;
  final String product_name;
  final double product_price;
  final List product_image;
  final int quantity;

  CartItem({this.product_id, this.product_name, this.product_price, this.product_image, this.quantity});


}

class Cart with ChangeNotifier{
  Map<String, CartItem> _carts = {};


  Map<String, CartItem> get cart {
    return {..._carts};
  }

  int get cartCount{
    return _carts.length;
  }

  void addItem(String productId, String productName, List productImage, double productPrice){
    if( _carts.containsKey(productId) ){
    //update cart
      _carts.update(
        productId, 
        (existingCart) => CartItem(
              product_id: existingCart.product_id, 
              product_name: existingCart.product_name, 
              product_price: existingCart.product_price,  
              product_image: existingCart.product_image, 
              quantity: existingCart.quantity + 1
      ));

    } else {
      _carts.putIfAbsent(
        productId, () => CartItem(
              product_id: DateTime.now().toString(), 
              product_name: productName, 
              product_price: productPrice,  
              product_image: productImage, 
              quantity: 1
        ));
    }

    notifyListeners();
    print(_carts);
  }


}