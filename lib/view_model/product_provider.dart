import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productList = [];
  List<String> cart = [];
  List<String> wishlist = [];

  void addProducts(List<dynamic> data) {
    for (var i = 0; i < data.length; i++) {
      productList.add(Product.fromJson(data[i]));
    }
    notifyListeners();
  }

  Product getProduct(String id) {
    for (var product in productList) {
      if (product.id == id) {
        return product;
      }
    }
    return productList[0];
  }
}
