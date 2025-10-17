enum Category { drinks, mains, snacks }

class Product {
  final String id;
  final String name;
  final Category category;
  final double price;
  final String? image; 

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.image,
  });
}


const kProducts = <Product>[
  Product(id: 'd1', name: 'Iced Tea',  category: Category.drinks, price: 49),
  Product(id: 'd2', name: 'Coffee',    category: Category.drinks, price: 59),
  Product(id: 'd3', name: 'Soda',      category: Category.drinks, price: 39),

  Product(id: 'm1', name: 'Burger',    category: Category.mains,  price: 129),
  Product(id: 'm2', name: 'Pasta',     category: Category.mains,  price: 149),
  Product(id: 'm3', name: 'Rice Bowl', category: Category.mains,  price: 119),

  Product(id: 's1', name: 'Fries',     category: Category.snacks, price: 69),
  Product(id: 's2', name: 'Nachos',    category: Category.snacks, price: 89),
  Product(id: 's3', name: 'Cookie',    category: Category.snacks, price: 39),
];

String catLabel(Category c) {
  switch (c) {
    case Category.drinks: return 'Drinks';
    case Category.mains:  return 'Mains';
    case Category.snacks: return 'Snacks';
  }
}
