import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';


class ProductGrid extends StatelessWidget {
  final String _category;

  ProductGrid(this._category);

  @override
  Widget build(BuildContext context) {
    var productsData      = Provider.of<Products>(context, listen: false).items;
    if(_category == 'women' || _category == 'sliper'){
       productsData      = Provider.of<Products>(context, listen: false).orderByCategory(_category);
    }

    var size                = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth  = size.width / 1.35;
    return new GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      itemCount: productsData.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: productsData[index],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
    );
  }
}