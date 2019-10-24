import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String product_name;
  final double product_price;
  final String product_image;

  ProductItem(this.id, this.product_name, this.product_price, this.product_image);
  
  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(product_image),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(product_name, style: Theme.of(context).textTheme.title),
                        SizedBox(height: 8.0),
                        Text('\$ ${product_price}', style: Theme.of(context).textTheme.title),
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