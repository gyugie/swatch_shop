import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/cart_item.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItem  = Provider.of<Cart>(context, listen: false).cart;
    return ListView.builder(
        itemCount: cartItem.length,
        itemBuilder: (ctx, index) => ItemCart(
          cartItem.values.toList()[index].product_id,
          cartItem.keys.toList()[index],
          cartItem.values.toList()[index].product_name,
          cartItem.values.toList()[index].product_image[0],
          cartItem.values.toList()[index].product_price,
          cartItem.values.toList()[index].quantity
        ),
    );
  }
}