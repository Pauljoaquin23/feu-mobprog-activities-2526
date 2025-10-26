


import 'package:simpleshopping_app/model/food_category.dart';class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name, 
    required this.quantity,
    required this.foodCategory,
  });

  final String id; 
  final String name; 
  final int quantity;
  final FoodCategory foodCategory;
}