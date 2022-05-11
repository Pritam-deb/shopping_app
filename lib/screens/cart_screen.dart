import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/cart_tile.dart';
import 'package:shopping_app/components/price_text.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/utils/text_styles.dart';
import 'package:shopping_app/view_model/cart_provider.dart';

import '../view_model/product_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double subtotal = 0.0;
  double shipping = 5.0;

  void updateSubtotal(double num) {
    setState(() {
      subtotal += num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'My Cart',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Consumer<CartProvider>(
          builder: (context, _provider, child) => _provider.cart.isNotEmpty
              ? Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _provider.cart.length,
                      itemBuilder: (context, index) {
                        Product product = Provider.of<ProductProvider>(context)
                            .getProduct(_provider.cart[index]);
                        return CartTile(
                          product: product,
                          updateSubtotal: updateSubtotal,
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Promo/Student Code or Vouchers',
                          style: CustomTextStyles().h2,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Total',
                              style: CustomTextStyles().greyText,
                            ),
                            PriceText(price: subtotal, fontSize: 20),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping',
                              style: CustomTextStyles().greyText,
                            ),
                            PriceText(price: shipping, fontSize: 20),
                          ]),
                    ),
                    // Add horizontal dotted line
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: CustomTextStyles().greyText,
                            ),
                            PriceText(price: subtotal + shipping, fontSize: 20),
                          ]),
                    ),
                    // Convert this button into a widget
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text("Checkout"),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          primary: Colors.white,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}

class CounterList extends StatefulWidget {
  const CounterList({
    Key? key,
    required this.updateSubtotal,
    required this.price,
  }) : super(key: key);

  final Function updateSubtotal;
  final double price;

  @override
  State<CounterList> createState() => _CounterListState();
}

class _CounterListState extends State<CounterList> {
  int _itemCount = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      widget.updateSubtotal(widget.price);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              Future.delayed(Duration.zero, () async {
                widget.updateSubtotal(-widget.price);
              });
              _itemCount = _itemCount > 0 ? _itemCount - 1 : _itemCount;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.remove,
              size: 16,
            ),
          ),
        ),
        Text(
          _itemCount.toString(),
          style: CustomTextStyles().h2,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _itemCount = _itemCount + 1;
              Future.delayed(Duration.zero, () async {
                widget.updateSubtotal(widget.price);
              });
            });
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.add,
              size: 16,
            ),
          ),
        ),
      ],
    );
    ;
  }
}
