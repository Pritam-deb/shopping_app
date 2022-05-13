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

  void fetchProducts(BuildContext context, selectedTab) async {
    final prefs = await SharedPreferences.getInstance();
    String res;

    if (prefs.getString(selectedTab) != null) {
      res = prefs.getString(selectedTab)!;
    } else {
      switch (selectedTab) {
        case 'Horror':
          {
            final response = await http.get(Uri.parse(Strings().fetchHorror));
            res = response.body;
            prefs.setString(selectedTab, res);
          }
          break;
        case 'Comedy':
          {
            final response = await http.get(Uri.parse(Strings().fetchComedy));
            res = response.body;
            prefs.setString(selectedTab, res);
          }
          break;
        case 'Drama':
          {
            final response = await http.get(Uri.parse(Strings().fetchDrama));
            res = response.body;
            prefs.setString(selectedTab, res);
          }
          break;
        case 'Documentary, Special Interests':
          {
            final response =
                await http.get(Uri.parse(Strings().fetchDocumentary));
            res = response.body;
            prefs.setString(selectedTab, res);
          }
          break;
        case 'Action and Adventure':
          {
            final response =
                await http.get(Uri.parse(Strings().fetchAdventure));
            res = response.body;
            prefs.setString(selectedTab, res);
          }
          break;
        default:
          {
            final response = await http.get(Uri.parse(Strings().fetchUrl));
            res = response.body;
            prefs.setString(selectedTab, res);
          }
          break;
      }
    }
    final jsonData = json.decode(res);
    Provider.of<ProductProvider>(
      context,
      listen: false,
    ).addProducts(jsonData['products']);
  }
}
