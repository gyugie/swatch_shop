import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/detail-product';
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>  with SingleTickerProviderStateMixin {
  TabController _controller;

    @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize  = MediaQuery.of(context).size;
    final productId   = ModalRoute.of(context).settings.arguments as String;
    final product     = Provider.of<Products>(context, listen: false).getProductById(productId);
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: deviceSize.height * 0.3,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: product.product_id,
                  child: Container(
                    child: SizedBox(
                        height: deviceSize.height * 0.25,
                        width: double.infinity,
                        child: Carousel(
                          images: product.product_image.map((url){
                            return NetworkImage(url);
                          }).toList(),
                          showIndicator: true,
                          dotSize: 5,
                          indicatorBgPadding: 10,
                          dotColor: Colors.grey,
                          dotIncreasedColor: Colors.black,
                          dotBgColor: Colors.transparent,
                          boxFit: BoxFit.fitWidth,
                          borderRadius: false,
                          moveIndicatorFromBottom: 180.0,
                          noRadiusForIndicator: true,
                          overlayShadow: true,
                          overlayShadowColors: Colors.white,
                          overlayShadowSize: 0.7,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                //sub header
                Card(
                    child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            product.product_name, 
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                              ), 
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '\$ ${product.product_price.toString()}', 
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                              ),
                            ),
                        )
                      ],
                    ),
                  )
                ),
                //detail product
                SizedBox(height: 10),
                Container(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          child: Text('Detail product', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          child: Text('${product.product_descriptiom}', style: TextStyle(fontSize: 14)),
                        )
                      ],
                    ),
                  ),
                ),
                //spesification
                Container(
                  height: 50,
                  decoration:  BoxDecoration(color: Colors.white),
                  child: TabBar(
                    indicatorColor: Colors.grey,
                    controller: _controller,
                    onTap: (_){

                    },
                    tabs: [
                      Tab(text: 'Dimension'),
                      Tab(text: 'Features'),
                    ],
                  ),
                ),
                Container(
                  height: deviceSize.height * 0.40,
                  child: TabBarView(
                    controller: _controller,
                    children: <Widget>[
                      Container(
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              spesification('Case 40', '${product.product_dimension[0]['case_40']}'),
                              Divider(),
                              spesification('Case 30', '${product.product_dimension[0]['case_30']}'),
                              Divider(),
                              spesification('Strap', '${product.product_dimension[0]['strap']}'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              spesification('Glass', '${product.product_features[0]['glass']}'),
                              Divider(),
                              spesification('Case', '${product.product_features[0]['case']}'),
                              Divider(),
                              spesification('Movement', '${product.product_features[0]['movement']}'),
                              Divider(),
                              spesification('Water Resistance', '${product.product_features[0]['water_resistance']}'),
                              Divider(),
                              spesification('Strap', '${product.product_features[0]['strap']}'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80)

              ]),
            ),
          ],
        ),
      )
    );
  }

    Widget spesification(String title, String description){
      final deviceSize  = MediaQuery.of(context).size;
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5),
              width: deviceSize.width * 0.15,
              child: Text('${title}', style: TextStyle(fontSize: 14, color: Colors.grey)),
            ),
            Container(
              width: deviceSize.width * 0.05,
              child: Text(':', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            Container(
              width: deviceSize.width * 0.70,
              child: Text('${description}', style: TextStyle(fontSize: 14)),
            )
          ],
        ),
      );
    }
}
