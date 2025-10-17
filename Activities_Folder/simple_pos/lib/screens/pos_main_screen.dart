import 'package:flutter/material.dart';
import '../models/product.dart';
import 'checkout_screen.dart';

class POSMainScreen extends StatefulWidget {
  static const route = '/main';
  final VoidCallback onToggleTheme;
  final Map<Product, int> cart;
  final void Function(Product, int) onAdd;

  const POSMainScreen({
    super.key,
    required this.onToggleTheme,
    required this.cart,
    required this.onAdd,
  });

  @override
  State<POSMainScreen> createState() => _POSMainScreenState();
}

class _POSMainScreenState extends State<POSMainScreen> {
  Future<void> _pickQty(Product p) async {
    final controller = TextEditingController(text: '1');
    final qty = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(p.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('₱${p.price.toStringAsFixed(2)} per unit'),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantity'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final q = int.tryParse(controller.text) ?? 0;
              Navigator.pop(ctx, q);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
    if (qty != null && qty > 0) {
      widget.onAdd(p, qty);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added $qty × ${p.name}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final cross = orientation == Orientation.portrait ? 3 : 5;
    final total = widget.cart.entries.fold<double>(
      0, (s, e) => s + e.key.price * e.value,
    );

    final categories = {
      Category.drinks: kProducts.where((p) => p.category == Category.drinks).toList(),
      Category.mains:  kProducts.where((p) => p.category == Category.mains).toList(),
      Category.snacks: kProducts.where((p) => p.category == Category.snacks).toList(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            tooltip: 'Toggle Light/Dark',
            onPressed: widget.onToggleTheme,
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: ListView(
        children: categories.entries.map((entry) {
          final label = catLabel(entry.key);
          final items = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                GridView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: cross,
                    mainAxisExtent: 120,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (_, i) {
                    final it = items[i];
                    return InkWell(
                      onTap: () => _pickQty(it),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (it.image != null)
                                Expanded(child: Image.asset(it.image!, fit: BoxFit.contain)),
                              Text(it.name, textAlign: TextAlign.center),
                              Text('₱${it.price.toStringAsFixed(2)}',
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FilledButton.icon(
            onPressed: widget.cart.isEmpty
                ? null
                : () => Navigator.pushNamed(context, CheckoutScreen.route),
            icon: const Icon(Icons.shopping_cart_checkout),
            label: Text('Checkout • ₱${total.toStringAsFixed(2)}'),
          ),
        ),
      ),
    );
  }
}
