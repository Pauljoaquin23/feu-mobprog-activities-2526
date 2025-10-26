import 'package:flutter/material.dart';
import 'package:simple_techstore/model/product.dart'; // Product, CartItem, GadgetCategory, categoryIcons, currency

class ProductAdd extends StatefulWidget {
  const ProductAdd({
    super.key,
    required this.product,
    required this.addToCart,
  });

  final Product product;
  final void Function(CartItem item) addToCart;

  @override
  State<ProductAdd> createState() => ProductAddState();
}

class ProductAddState extends State<ProductAdd> {
  final quantityController = TextEditingController();

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  void submitProductData() {
    final quantity = int.tryParse(quantityController.text);

    if (quantity == null 
    || quantity <= 0) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Invalid Quantity',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            'Please enter a valid quantity (1 or more).',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text('OK', style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        ),
      );
      return;
    }

    final item = CartItem(
      product: widget.product, 
      quantity: quantity);


      widget.addToCart(item);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Added to Cart',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          'Item: ${widget.product.name}'
          '\nQty: $quantity'
          '\nTotal: ${currency.format(item.total)}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx); 
              Navigator.pop(context); 
            },
            child: Text('OK', style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prod = widget.product;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            prod.name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Text(
                prod.formattedPrice,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[prod.category]),
                  const SizedBox(width: 6),
                  Text(
                    prod.category.name.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.titleMedium,
            decoration: const InputDecoration(
              label: Text('Quantity'),
              hintText: 'Enter quantity',
            ),
          ),
          const SizedBox(height: 16),

          Builder(
            builder: (_) {
              final quantity = int.tryParse(quantityController.text) ?? 0;
              final total = prod.price * quantity;
              return Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Total: ${currency.format(total)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            },
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: submitProductData,
                child: const Text('Add to Cart'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
