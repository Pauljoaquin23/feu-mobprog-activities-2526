import 'package:flutter/material.dart';
import '../models/product.dart';
import 'pos_main_screen.dart';

class CheckoutScreen extends StatefulWidget {
  static const route = '/checkout';

  final Map<Product, int> cart;
  final void Function(Product) onRemove;
  final VoidCallback onClear;

  const CheckoutScreen({
    super.key,
    required this.cart,
    required this.onRemove,
    required this.onClear,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  double get _grandTotal =>
      widget.cart.entries.fold(0, (s, e) => s + e.key.price * e.value);

  // simple homemade bar chart (like class activity chart_bar.dart style)
  Widget _categoryBarChart() {
    final counts = <Category, int>{
      Category.drinks: 0,
      Category.mains: 0,
      Category.snacks: 0,
    };
    widget.cart.forEach((p, qty) => counts[p.category] = counts[p.category]! + qty);

    final maxV = (counts.values.fold<int>(0, (m, v) => v > m ? v : m)).clamp(1, 999);

    List<Widget> columns = [];
    for (final entry in counts.entries) {
      final label = catLabel(entry.key);
      final value = entry.value;
      final hPct = value / maxV;

      columns.add(Expanded(
        child: Column(
          children: [
            // bar
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 180 * hPct,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontSize: 12)),
            Text('$value', style: const TextStyle(fontSize: 11)),
          ],
        ),
      ));
    }

    return SizedBox(height: 220, child: Row(children: columns));
  }

  @override
  Widget build(BuildContext context) {
    final entries = widget.cart.entries.toList();

    return Scaffold(
      appBar: AppBar(title: Text('Total: ₱${_grandTotal.toStringAsFixed(2)}')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: _categoryBarChart(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (_, i) {
                final item = entries[i].key;
                final qty = entries[i].value;
                final subtotal = item.price * qty;

                return Dismissible(
                  key: ValueKey(item.id),
                  background: Container(color: Colors.red),
                  onDismissed: (_) {
                    widget.onRemove(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Removed ${item.name}')),
                    );
                    setState(() {});
                  },
                  child: ListTile(
                    leading: (item.image != null)
                        ? Image.asset(item.image!, width: 40, height: 40)
                        : const Icon(Icons.fastfood),
                    title: Text('${item.name}  × $qty'),
                    subtitle: Text(catLabel(item.category)),
                    trailing: Text('₱${subtotal.toStringAsFixed(2)}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, POSMainScreen.route),
                  child: const Text('Back to Main'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    widget.onClear();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
                  },
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
