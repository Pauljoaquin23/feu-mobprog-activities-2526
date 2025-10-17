import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/pos_main_screen.dart';
import 'screens/checkout_screen.dart';
import 'models/product.dart';

void main() => runApp(const SimplePOSApp());

class SimplePOSApp extends StatefulWidget {
  const SimplePOSApp({super.key});
  @override
  State<SimplePOSApp> createState() => _SimplePOSAppState();
}

class _SimplePOSAppState extends State<SimplePOSApp> {
  ThemeMode _mode = ThemeMode.light;
  void _toggleTheme() {
    setState(() {
      _mode = (_mode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  // shared cart 
  final Map<Product, int> _cart = {};

  void addToCart(Product p, int qty) {
    if (qty <= 0) return;
    setState(() => _cart.update(p, (v) => v + qty, ifAbsent: () => qty));
  }
  void removeFromCart(Product p) => setState(() => _cart.remove(p));
  void clearCart() => setState(_cart.clear);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple POS',
      debugShowCheckedModeBanner: false,
      themeMode: _mode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => LoginScreen(onToggleTheme: _toggleTheme),
            );
          case POSMainScreen.route:
            return MaterialPageRoute(
              builder: (_) => POSMainScreen(
                onToggleTheme: _toggleTheme,
                cart: _cart,
                onAdd: addToCart,
              ),
            );
          case CheckoutScreen.route:
            return MaterialPageRoute(
              builder: (_) => CheckoutScreen(
                cart: _cart,
                onRemove: removeFromCart,
                onClear: clearCart,
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => LoginScreen(onToggleTheme: _toggleTheme),
            );
        }
      },
    );
  }
}
