import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/view_model/product_provider.dart';
import 'package:shopping_app/utils/strings.dart';

class NetworkRequests {
  NetworkRequests._();
  static final NetworkRequests _instance = NetworkRequests._();
  factory NetworkRequests() => _instance;

  void fetchProducts(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String res;

    if (prefs.getString('allData') != null) {
      res = prefs.getString('allData')!;
    } else {
      final response = await http.get(Uri.parse(Strings().fetchUrl));
      res = response.body;
      prefs.setString('allData', res);
    }
    final jsonData = json.decode(res);
    Provider.of<ProductProvider>(
      context,
      listen: false,
    ).addProducts(jsonData['products']);
  }
}
