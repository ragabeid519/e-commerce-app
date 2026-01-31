import 'package:flutter/material.dart';

import '../posts/models/products_data.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ProductsData> favoriteItems = [];

  void addToFavorite(ProductsData product) {
    favoriteItems.add(product);
    notifyListeners();
  }

  void removeFromFavorite(ProductsData product) {
    favoriteItems.remove(product);
    notifyListeners();
  }
}
