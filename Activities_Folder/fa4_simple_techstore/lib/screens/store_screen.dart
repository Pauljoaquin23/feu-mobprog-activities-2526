import 'package:flutter/material.dart';

import 'package:simple_techstore/chart/chart.dart';
import 'package:simple_techstore/screens/product_list.dart';
import 'package:simple_techstore/screens/product_add.dart';
import 'package:simple_techstore/model/product.dart';
import 'package:simple_techstore/data/dummy_products.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() {
    return _StoreScreenState();
  }
}

class _StoreScreenState extends State<StoreScreen> {
  final List<Product> products = List<Product>.from(productsItems);

  final List<CartItem> _cartItems = <CartItem>[];

  int get cartCount {
    return _cartItems.fold(0, (sum, it) => sum + it.quantity);
  }

  double get cartTotal {
    return _cartItems.fold(0.0, (sum, it) => sum + it.total);
  }

  void _openAddToCartModal(Product product) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return ProductAdd(
          product: product,
          addToCart: _addToCart,
        );
      },
    );
  }

  //add item
  void _addToCart(CartItem item) {
    setState(() {
      _cartItems.add(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${item.product.name} added to cart (x${item.quantity}).',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _openCartView() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        if (_cartItems.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Your cart is empty.',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          );
        }

        return StatefulBuilder(
          builder:
              (
                BuildContext innerCtx,
                void Function(void Function()) setModalState,
              ) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //  items that you can swipe to delete
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _cartItems.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          final CartItem item = _cartItems[index];

                          return Dismissible(
                            key: ValueKey(item.id),

                            direction: DismissDirection.endToStart,

                            onDismissed: (DismissDirection dir) {
                              // copy for undo
                              final CartItem removed = item;
                              final int removedIndex = index;

                              // remove from cart
                              setState(() {
                                _cartItems.removeAt(removedIndex);
                              });

                              //  rebuild
                              setModalState(() {});

                              // undo
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Removed "${removed.product.name}".',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  duration: Duration(seconds: 3),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      setState(() {
                                        _cartItems.insert(
                                          removedIndex,
                                          removed,
                                        );
                                      });
                                      setModalState(() {});
                                    },
                                  ),
                                ),
                              );
                            },

                            child: ListTile(
                              leading: Icon(
                                categoryIcons[item.product.category],
                              ),
                              title: Text(
                                item.product.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              subtitle: Text(
                                'x${item.quantity} • ${item.product.formattedPrice}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              trailing: Text(
                                currency.format(item.total),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          );
                        },
                      ),

                      Divider(height: 24.0, thickness: 1.0),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Total: ${currency.format(cartTotal)}',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.right,
                        ),
                      ),

                      SizedBox(height: 8.0),
                    ],
                  ),
                );
              },
        );
      },
    );
  }

  // store selected category
  GadgetCategory selectedCategory = GadgetCategory.phones;

  //  dropdown
  Widget buildCategoryFilter() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        spacing: 10,
        children: [
          DropdownButton<GadgetCategory>(
            value: selectedCategory,
            items: GadgetCategory.values.map(
              (category) {
                return DropdownMenuItem<GadgetCategory>(
                  value: category,
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(categoryIcons[category]),
                      Text(category.name.toString().toUpperCase()),
                    ],
                  ),
                );
              },
            ).toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }

              setState(() {
                selectedCategory = value;
              });
            },
          ),
        ],
      ),
    );
  }

  List<Product> get filteredProducts {
    return products.where((product) {
      return product.category == selectedCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text(
        'No products found for ${selectedCategory.name.toUpperCase()}.',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );

    if (filteredProducts.isNotEmpty) {
      mainContent = ProductList(
        products: filteredProducts,
        onAddToCart: (product) {
          _openAddToCartModal(product);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('TechStore'),
        actions: <Widget>[
          IconButton(
            onPressed: _openCartView,
            icon: Stack(
              children: <Widget>[
                Icon(Icons.shopping_cart_outlined),
                if (cartCount > 0)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                      ),
                      constraints: BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Center(
                        child: Text(
                          '$cartCount',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

      body: (screenWidth < 600)
          ? Column(
              children: [
                Chart(items: _cartItems),
                buildCategoryFilter(),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(items: _cartItems),
                ),
                Expanded(
                  child: Column(
                    children: [
                      buildCategoryFilter(),
                      Expanded(
                        child: mainContent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
