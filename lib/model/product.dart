import 'dart:core';

class Product {
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
