import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/model/cart.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> cart = [];

  void updateCart(String id, String quality) async {
    final prefs = await SharedPreferences.getInstance();
    final cartItem = Cart(count: 1, quality: quality, id: id);

    bool add = true;
    for (var element in cart) {
      if (element.id == id) {
        cart.remove(element);
        add = false;
      }
    }
    if (add) {
      cart.add(cartItem);
    }

    // await prefs.setStringList('cart', cart.to);
    notifyListeners();
  }

  bool containsProduct(String id) {
    for (var element in cart) {
      if (element.id == id) {
        return true;
      }
    }
    // notifyListeners();
    return false;
  }

  void updateCount(String id, double count) {
    for (var element in cart) {
      if (element.id == id) {
        element.count = count;
        break;
      }
    }
  }

  void removeFromCart(String id) {
    for (var element in cart) {
      if (element.id == id) {
        cart.remove(element);
        break;
      }
    }
    notifyListeners();
  }
}
