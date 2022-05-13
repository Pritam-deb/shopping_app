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
    required this.showCounter,
  }) : super(key: key);

  final Product product;
  final Function updateSubtotal;
  final bool showCounter;

  @override
  Widget build(BuildContext context) {
    return showCounter == true
        ? Row(
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
              SizedBox(
                height: 160.toHeight,
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
                    PriceText(price: product.price, fontSize: 16.toFont),
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
          )
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      spreadRadius: 0,
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 120.toHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Text(product.name)
              // SizedBox(
              //   height: 160.toHeight,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SizedBox(
              //         width: 200,
              //         child: Text(
              //           product.name,
              //           style: const TextStyle(
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //       PriceText(price: product.price, fontSize: 16.toFont),
              //       SizedBox(
              //         width: 100,
              //         child: CounterList(
              //           updateSubtotal: updateSubtotal,
              //           price: product.price,
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          );
  }
}
