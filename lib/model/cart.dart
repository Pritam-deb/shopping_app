import 'dart:core';

class Cart {
  late String id;
  late String quality;
  late double count = 1;

  Cart({
    required this.id,
    required this.quality,
    required this.count,
  });
}
