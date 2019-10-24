import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
     return Container(
       padding: EdgeInsets.all(2),
        child: new Stack(
          children: <Widget>[
             Card(
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.network(product.product_image),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${product.product_name}', style: Theme.of(context).textTheme.title),
                        SizedBox(height: 8.0),
                        Text('\$ ${product.product_price}', style: Theme.of(context).textTheme.title),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.0, -0.4),
              child: Align(
                child: CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor:  Colors.amber,
                  radius: 16.0,
                  child: Icon(Icons.star,size: 20),
                ),
                alignment: FractionalOffset(0.90, 0.55),
              ),
            ),
          ],
        ),
    );
  }
}