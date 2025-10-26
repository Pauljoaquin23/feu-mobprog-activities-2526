
import 'package:simpleshopping_app/data/food_categories.dart';
import 'package:simpleshopping_app/model/food_category.dart';
import 'package:simpleshopping_app/model/grocery_item.dart';

final groceryItems = [
  GroceryItem(
    id: 'a',
    name: 'Kangkong',
    quantity: 2,
    foodCategory: foodCategories[FoodCategories.vegetables]!,
  ),
  GroceryItem(
    id: 'b',
    name: 'Apple',
    quantity: 6,
    foodCategory: foodCategories[FoodCategories.fruit]!,
  ),
  GroceryItem(
    id: 'c',
    name: 'Porkchop',
    quantity: 10,
    foodCategory: foodCategories[FoodCategories.meat]!,
  ),
];
 