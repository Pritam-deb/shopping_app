import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/counter_list.dart';
import 'package:shopping_app/components/price_text.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/services/size_config.dart';
import 'package:shopping_app/utils/helpers.dart';
import 'package:shopping_app/utils/text_styles.dart';
import 'package:shopping_app/view_model/cart_provider.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
    required this.product,
    required this.updateSubtotal,
    required this.counter,
    this.quality,
    required this.count,
  }) : super(key: key);

  final Product product;
  final Function updateSubtotal;
  final bool counter;
  final String? quality;
  final double count;

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
                  Helper().getName(product.name),
                  style: CustomTextStyles().h2,
                ),
                quality != null
                    ? Text(
                        'Quality : ${quality!}',
                        style: CustomTextStyles().h2,
                      )
                    : const SizedBox(),
                PriceText(
                  price: product.price,
                  fontSize: 16.toFont,
                  center: false,
                ),
                counter
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: CounterList(
                              updateSubtotal: updateSubtotal,
                              price: product.price,
                              id: product.id,
                              count: count,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeFromCart(product.id);
                            },
                            child: const Icon(Icons.cancel),
                          ),
                        ],
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
