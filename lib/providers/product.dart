
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String product_id;
  final String product_name;
  final String product_descriptiom;
  final double product_price;
  final String product_image;
  final List product_features;
  final List product_dimension;
  final String product_category;
  final String creator_id;
  bool isFavorites;

  Product({
    @required this.product_id,
    @required this.product_name,
    @required this.product_descriptiom,
    @required this.product_price,
    @required this.product_image,
    @required this.product_features,
    @required this.product_dimension,
    @required this.product_category,
    @required this.creator_id,
    this.isFavorites = false
  });


}