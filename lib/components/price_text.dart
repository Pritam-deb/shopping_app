import 'package:flutter/material.dart';
import 'package:shopping_app/services/size_config.dart';

class PriceText extends StatelessWidget {
  const PriceText({
    Key? key,
    required this.price,
    required this.fontSize,
    required this.center,
  }) : super(key: key);

  final double price;
  final double fontSize;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          '\u{20AC} ',
          style: TextStyle(
            fontSize: fontSize.toFont,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          price.toStringAsFixed(2),
          style: TextStyle(
            fontSize: fontSize.toFont,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
