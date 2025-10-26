  import 'package:flutter/material.dart';
  import 'package:uuid/uuid.dart';
  import 'package:intl/intl.dart';

  final currency = NumberFormat.currency(locale: 'en_PH', symbol: '₱');

  const uuid = Uuid();

  enum GadgetCategory {
    phones,
    laptops,
    accessories,
    
  }

  const categoryIcons = {
    GadgetCategory.phones: Icons.smartphone,
    GadgetCategory.laptops: Icons.laptop_mac,
    GadgetCategory.accessories: Icons.headphones,
  };

  class Product {
    Product({
      required this.name,
      required this.price,
      required this.category,
      this.description,
      this.assetImage,
    }) : id = uuid.v4();

    final String id;
    final String name;
    final double price;
    final String? description;
    final String? assetImage;
    final GadgetCategory category;
    


    String get formattedPrice  {
      return currency.format(price);
    }
  }

  class CartItem {
    CartItem({
      required this.product,
      this.quantity = 1,
    })  : id = uuid.v4();
          

    final String id;
    final Product product;
    int quantity;

    double get total { 
    return product.price * quantity;
    }

    String get formattedTotal { 
      return currency.format(total); }
  }

  class CartBucket {
    const CartBucket({
      required this.category,
      required this.items,
    });

    CartBucket.forCategory(List<CartItem> allItems, this.category)
        : items = allItems
              .where((item) => item.product.category == category)
              .toList();

    final GadgetCategory category;
    final List<CartItem> items;

    double get totalByCategory {
      double sum = 0;
      for (final item in items) {
        sum += item.total;
      }
      return sum;
    }

    String get formattedTotalByCategory => currency.format(totalByCategory);

    // number of items in this category 
    int get countByCategory {
  var totalItems = 0;
  for (var item in items) {
    totalItems += item.quantity;
  }
  return totalItems;
}
  }
