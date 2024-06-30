import 'package:flutter/material.dart';
import 'package:cart_app_with_provider/model/product.dart';

class Cart with ChangeNotifier {
  List<Product> _item = [];
  double _price = 0;
  int quantity = 0;

  void addProduct(Product product) {
    _item.add(product);
    _price += product.price;
    notifyListeners();
  }

  int get count {
    return _item.length;
  }

  double get price {
    return _price;
  }

  List<Product> get basketItem {
    return _item;
  }

  void RemoveProduct(Product product) {
    _item.remove(product);
    _price -= product.price;

    notifyListeners();
  }
}
