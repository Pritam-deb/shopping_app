import 'package:flutter/material.dart';
import 'package:shopping_app/components/counter_list.dart';
import 'package:shopping_app/components/price_text.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/services/size_config.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
    required this.product,
    required this.updateSubtotal,
    required this.counter,
  }) : super(key: key);

  final Product product;
  final Function updateSubtotal;
  final bool counter;

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
          height: 180.toHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 160.toHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PriceText(
                    price: product.price, fontSize: 16.toFont, center: false),
                counter
                    ? SizedBox(
                        width: 100,
                        child: CounterList(
                          updateSubtotal: updateSubtotal,
                          price: product.price,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
