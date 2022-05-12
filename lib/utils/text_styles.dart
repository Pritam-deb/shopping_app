import 'package:flutter/material.dart';
import 'package:shopping_app/services/size_config.dart';

class CustomTextStyles {
  CustomTextStyles._();
  static final CustomTextStyles _instance = CustomTextStyles._();
  factory CustomTextStyles() => _instance;

  TextStyle h1 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20.toFont,
  );

  TextStyle h2 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16.toFont,
  );

  TextStyle greyText = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 16.toFont,
  );
}
