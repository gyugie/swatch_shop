import 'package:flutter/material.dart';
import '../widgets/cart_item.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 12,
        itemBuilder: (ctx, index) => ItemCart(),
    );
  }
}