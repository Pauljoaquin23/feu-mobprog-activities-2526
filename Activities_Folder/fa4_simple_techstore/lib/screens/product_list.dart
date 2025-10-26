import 'package:flutter/material.dart';
import 'package:simple_techstore/model/product.dart';
import 'package:simple_techstore/screens/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.products,
    this.onAddToCart,
  });

  final List<Product> products;
  final void Function(Product product)? onAddToCart;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Text(
          'No products found.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: products.length,
      itemBuilder: (BuildContext ctx, int index) {
        final Product product = products[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ProductItem(
            product,
            onAddToCart: onAddToCart == null
                ? null
                : () {
                    onAddToCart!(product);
                  },
          ),
        );
      },
    );
  }
}
