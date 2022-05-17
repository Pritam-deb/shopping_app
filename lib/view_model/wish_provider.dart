import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishProvider extends ChangeNotifier {
  List<String> wish = [];

  void updateWish(String id) async {
    final prefs = await SharedPreferences.getInstance();
    if (wish.contains(id)) {
      wish.remove(id);
    } else {
      wish.add(id);
    }
    await prefs.setStringList('wish', wish);
    notifyListeners();
  }
}
