import 'package:flutter/material.dart';
import 'package:simple_techstore/model/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
    this.product, {
    super.key,
    this.onAddToCart,
  });

  final Product product;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // image area 
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: product.assetImage == null
                    ? Container(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceVariant.withOpacity(0.4),
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 50.0,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : Image.asset(
                        product.assetImage!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            const SizedBox(height: 10.0),

            // price
            Text(
              product.formattedPrice,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue.shade700,
              ),
            ),

            const SizedBox(height: 4.0),

            // name
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 14.0,
              ),
            ),

           // same like spacer
            const SizedBox(height: 8.0),

            // button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onAddToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 128, 255),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
