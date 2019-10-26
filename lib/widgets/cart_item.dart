import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ItemCart extends StatelessWidget {
  final String id;
  final String productId;
  final String productName;
  final String productImage;
  final double productPrice;
  final int quantity;

  ItemCart(this.id, this.productId, this.productName, this.productImage, this.productPrice, this.quantity);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      child:  ListTile(
        leading: Image.network(productImage),
        title: Text(productName),
        subtitle: Text(' Rp. ${productPrice * quantity}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: (){
                cart.removingSingleItem(productId);
              },
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.yellow[200],
              child: Center(
                child: Text('${quantity}'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                cart.addItem(id, null, null, null);
              },
            ),
          ],
        ),
      )
    );
  }
}