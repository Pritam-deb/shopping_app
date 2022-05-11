import 'package:flutter/material.dart';

class CustomTextStyles {
  CustomTextStyles._();
  static final CustomTextStyles _instance = CustomTextStyles._();
  factory CustomTextStyles() => _instance;

  TextStyle h1 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  TextStyle h2 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  TextStyle greyText = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}
