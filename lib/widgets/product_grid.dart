import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import '../providers/product.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> _loadedProducts = [
    Product(
        product_id: '1',
        product_name: 'Brown top grain Italian leather strap',
        product_descriptiom: 'WORLD CLASS MANUFACTURING Powering this elegant timepiece is the Swiss Made Ronda Cal. 785. Fitted with a domed sapphire crystal, the second hardest mineral on earth next to diamond. Encased in surgical grade stainless steel with 100m water resistance. Paired with a top grain Italian leather strap, the strongest and most durable part of the hide.',
        product_price:22.00,
        product_image: 'https://brathwait.imgix.net/images/products/020-quartz-rosegold-marron-frontal.png?auto=compress%2Cformat&bg=00ffffff&fit=fill&fm=jpg&h=500&ixlib=php-1.1.0&q=90&sharp=0&w=500&s=08dd580ea5c5c39968aaa3fdc400180b',
        creator_id: '12',
        product_dimension: [
          {
            'case_40' : '40 mm wide and 7,5 mm tall (1.57 x 0.27 inch).',
            'case_30' : '36 mm wide and 6,9 mm tall (1.41 x 0.26 inch)',
            'strap'   : 'Stainless steel mesh strap: 20 mm wide (40 mm case), 16 mm wide (36 mm case)'
          }
        ],
        product_features: [
          {
            'glass': 'Dome sapphire glass, 1,9 mm thick w/anti reflective coating.',
            'case' : 'AISI 316l stainless steel - 40 mm or 36 mm wide.',
            'movement': 'Swiss quartz precision movement w/ second hand tick motion.',
            'water_resistance': 'Water resistant to 100 meters /10 bar (328 feet).',
            'strap': 'Quick release - one size fits all.',
          }
        ]
      ),
      Product(
      product_id: '2',
      product_name: 'Stainless Steel mesh strap',
      product_descriptiom: 'WORLD CLASS MANUFACTURING Powering this elegant timepiece is the Swiss Made Ronda Cal. 785. Fitted with a domed sapphire crystal, the second hardest mineral on earth next to diamond. Encased in surgical grade stainless steel with 100m water resistance. Paired with a stainless steel mesh strap - one size fits all.',
      product_price:25.00,
      product_image: 'https://brathwait.imgix.net/images/products/028-quartz-steel-mesh-frontal.png?auto=compress%2Cformat&bg=00ffffff&fit=fill&fm=jpg&h=500&ixlib=php-1.1.0&q=90&sharp=0&w=500&s=7599a93adea4cafeee5b8a6bbe3ebdf6',
      creator_id: '12',
      product_dimension: [
        {
          'case_40' : '40 mm wide and 7,5 mm tall (1.57 x 0.27 inch).',
          'case_30' : '36 mm wide and 6,9 mm tall (1.41 x 0.26 inch)',
          'strap'   : 'Stainless steel mesh strap: 20 mm wide (40 mm case), 16 mm wide (36 mm case)'
        }
      ],
      product_features: [
        {
          'glass': 'Dome sapphire glass, 1,9 mm thick w/anti reflective coating.',
          'case' : 'AISI 316l stainless steel - 40 mm or 36 mm wide.',
          'movement': 'Swiss quartz precision movement w/ second hand tick motion.',
          'water_resistance': 'Water resistant to 100 meters /10 bar (328 feet).',
          'strap': 'Quick release - one size fits all.',
        }
      ]
    ),
      Product(
      product_id: '2',
      product_name: 'Stainless Steel mesh strap',
      product_descriptiom: 'WORLD CLASS MANUFACTURING Powering this elegant timepiece is the Swiss Made Ronda Cal. 785. Fitted with a domed sapphire crystal, the second hardest mineral on earth next to diamond. Encased in surgical grade stainless steel with 100m water resistance. Paired with a stainless steel mesh strap - one size fits all.',
      product_price:25.00,
      product_image: 'https://brathwait.imgix.net/images/products/028-quartz-steel-mesh-frontal.png?auto=compress%2Cformat&bg=00ffffff&fit=fill&fm=jpg&h=500&ixlib=php-1.1.0&q=90&sharp=0&w=500&s=7599a93adea4cafeee5b8a6bbe3ebdf6',
      creator_id: '12',
      product_dimension: [
        {
          'case_40' : '40 mm wide and 7,5 mm tall (1.57 x 0.27 inch).',
          'case_30' : '36 mm wide and 6,9 mm tall (1.41 x 0.26 inch)',
          'strap'   : 'Stainless steel mesh strap: 20 mm wide (40 mm case), 16 mm wide (36 mm case)'
        }
      ],
      product_features: [
        {
          'glass': 'Dome sapphire glass, 1,9 mm thick w/anti reflective coating.',
          'case' : 'AISI 316l stainless steel - 40 mm or 36 mm wide.',
          'movement': 'Swiss quartz precision movement w/ second hand tick motion.',
          'water_resistance': 'Water resistant to 100 meters /10 bar (328 feet).',
          'strap': 'Quick release - one size fits all.',
        }
      ]
    ),
      Product(
      product_id: '2',
      product_name: 'Stainless Steel mesh strap',
      product_descriptiom: 'WORLD CLASS MANUFACTURING Powering this elegant timepiece is the Swiss Made Ronda Cal. 785. Fitted with a domed sapphire crystal, the second hardest mineral on earth next to diamond. Encased in surgical grade stainless steel with 100m water resistance. Paired with a stainless steel mesh strap - one size fits all.',
      product_price:25.00,
      product_image: 'https://brathwait.imgix.net/images/products/028-quartz-steel-mesh-frontal.png?auto=compress%2Cformat&bg=00ffffff&fit=fill&fm=jpg&h=500&ixlib=php-1.1.0&q=90&sharp=0&w=500&s=7599a93adea4cafeee5b8a6bbe3ebdf6',
      creator_id: '12',
      product_dimension: [
        {
          'case_40' : '40 mm wide and 7,5 mm tall (1.57 x 0.27 inch).',
          'case_30' : '36 mm wide and 6,9 mm tall (1.41 x 0.26 inch)',
          'strap'   : 'Stainless steel mesh strap: 20 mm wide (40 mm case), 16 mm wide (36 mm case)'
        }
      ],
      product_features: [
        {
          'glass': 'Dome sapphire glass, 1,9 mm thick w/anti reflective coating.',
          'case' : 'AISI 316l stainless steel - 40 mm or 36 mm wide.',
          'movement': 'Swiss quartz precision movement w/ second hand tick motion.',
          'water_resistance': 'Water resistant to 100 meters /10 bar (328 feet).',
          'strap': 'Quick release - one size fits all.',
        }
      ]
    ),
      Product(
      product_id: '2',
      product_name: 'Stainless Steel mesh strap',
      product_descriptiom: 'WORLD CLASS MANUFACTURING Powering this elegant timepiece is the Swiss Made Ronda Cal. 785. Fitted with a domed sapphire crystal, the second hardest mineral on earth next to diamond. Encased in surgical grade stainless steel with 100m water resistance. Paired with a stainless steel mesh strap - one size fits all.',
      product_price:25.00,
      product_image: 'https://brathwait.imgix.net/images/products/028-quartz-steel-mesh-frontal.png?auto=compress%2Cformat&bg=00ffffff&fit=fill&fm=jpg&h=500&ixlib=php-1.1.0&q=90&sharp=0&w=500&s=7599a93adea4cafeee5b8a6bbe3ebdf6',
      creator_id: '12',
      product_dimension: [
        {
          'case_40' : '40 mm wide and 7,5 mm tall (1.57 x 0.27 inch).',
          'case_30' : '36 mm wide and 6,9 mm tall (1.41 x 0.26 inch)',
          'strap'   : 'Stainless steel mesh strap: 20 mm wide (40 mm case), 16 mm wide (36 mm case)'
        }
      ],
      product_features: [
        {
          'glass': 'Dome sapphire glass, 1,9 mm thick w/anti reflective coating.',
          'case' : 'AISI 316l stainless steel - 40 mm or 36 mm wide.',
          'movement': 'Swiss quartz precision movement w/ second hand tick motion.',
          'water_resistance': 'Water resistant to 100 meters /10 bar (328 feet).',
          'strap': 'Quick release - one size fits all.',
        }
      ]
    )
  ];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.35;
    return new GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      itemCount: _loadedProducts.length,
      itemBuilder: (ctx, index) => ProductItem(
        _loadedProducts[index].product_id,
        _loadedProducts[index].product_name,
        _loadedProducts[index].product_price,
        _loadedProducts[index].product_image,
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