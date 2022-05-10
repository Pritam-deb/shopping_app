import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  List<String> cart = [];

  void updateCart(String id) async {
    final prefs = await SharedPreferences.getInstance();
    if (cart.contains(id)) {
      cart.remove(id);
    } else {
      cart.add(id);
    }
    await prefs.setStringList('cart', cart);
    notifyListeners();
  }
}
