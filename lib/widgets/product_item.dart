import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
     return Container(
       padding: EdgeInsets.all(2),
        child: InkWell(
        splashColor: Colors.amber,  
        onTap: (){
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.product_id);
          },
        child: Hero(
          tag: product.product_id,
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
                      child: Image.network(product.product_image[1], fit: BoxFit.fitHeight),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
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
                    child: GestureDetector(
                      onTap: (){
                        print('like');
                      },
                      child: CircleAvatar(
                      foregroundColor: Colors.white,
                      backgroundColor:  Colors.amber,
                      radius: 16.0,
                      child: Icon(Icons.favorite_border,size: 20),
                    ),
                  ),
                  alignment: FractionalOffset(0.90, 0.55),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}