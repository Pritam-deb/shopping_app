import 'dart:core';

class Product {
  late String name;
  late String price;
  late String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  Product.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'] ?? "";
    price = parsedJson['price'] ?? "";
    imageUrl = parsedJson['imageUrl'] ?? "";
  }
}
