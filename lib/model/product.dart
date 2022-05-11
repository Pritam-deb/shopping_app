import 'dart:core';

import 'package:uuid/uuid.dart';

class Product {
  String id = const Uuid().v4();
  late String name;
  late double price;
  late String imageUrl;
  late String plot;
  late String type;
  late String genre;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.plot,
    required this.type,
    required this.genre,
  });

  Product.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'] ?? "";
    price = parsedJson['salePrice'] ?? 0.0;
    imageUrl = parsedJson['image'] ?? "";
    plot = parsedJson['plot'] ?? "";
    type = parsedJson['type'] ?? "";
    genre = parsedJson['genre'] ?? "";
  }
}
