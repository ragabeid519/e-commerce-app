import 'package:fire_base_project2/posts/models/products_data.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<ProductsData> cartItems = [];

  void addToCart(ProductsData product) {
    cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductsData product) {
    cartItems.remove(product);
    notifyListeners();
  }

  bool isInCart(ProductsData product) {
    return cartItems.any((p) => p.id == product.id);
  }

  int get itemCount => cartItems.length;
}
