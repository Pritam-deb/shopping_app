import 'package:flutter/material.dart';
import 'package:shopping_app/components/price_text.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/screens/cart_screen.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
    required this.product,
    required this.updateSubtotal,
  }) : super(key: key);

  final Product product;
  final Function updateSubtotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                spreadRadius: 0,
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          height: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PriceText(price: product.price, fontSize: 16),
              SizedBox(
                width: 100,
                child: CounterList(
                  updateSubtotal: updateSubtotal,
                  price: product.price,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
