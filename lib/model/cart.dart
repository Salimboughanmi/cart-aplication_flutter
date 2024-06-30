import 'package:flutter/material.dart';
import 'package:cart_app_with_provider/model/product.dart';

class Cart with ChangeNotifier {
  List<Product> _items = [];
  double _price = 0;
  int quantity = 0;

  void addProduct(Product product) {
    _items.add(product);
    _price += product.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get price {
    return _price;
  }
}
