import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/carousel_card.dart';
import '../components/cart_tile.dart';
import '../services/size_config.dart';

import '../model/product.dart';
import '../view_model/cart_provider.dart';
import '../view_model/product_provider.dart';

enum PaymentCard { applePay, masterCard, visaCard }

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentCard? _card = PaymentCard.applePay;
  void updateSubtotal(double num) {
    setState(() {
      subtotal += num;
    });
  }

  double subtotal = 0.0;

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
            'Checkout',
            style: TextStyle(color: Colors.grey),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Text(
                'Delivery Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Column(
                      children: [
                        Text(
                          'Address line 1',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Address City',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.0,
                  color: Colors.grey,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Text(
                'Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.apple),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apple Pay',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '**** **** 0357 8420',
                          style: TextStyle(
                              color: Colors.grey, fontSize: 13.toFont),
                        )
                      ],
                    ),
                  ],
                ),
                Radio(
                  value: PaymentCard.applePay,
                  groupValue: _card,
                  onChanged: (PaymentCard? value) {
                    setState(() {
                      _card = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.card_membership),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Master Card',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '**** **** 0357 8420',
                          style: TextStyle(
                              color: Colors.grey, fontSize: 13.toFont),
                        )
                      ],
                    ),
                  ],
                ),
                Radio(
                  value: PaymentCard.masterCard,
                  groupValue: _card,
                  onChanged: (PaymentCard? value) {
                    setState(() {
                      _card = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.card_giftcard),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VISA Card',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '**** **** 0357 8420',
                          style: TextStyle(
                              color: Colors.grey, fontSize: 13.toFont),
                        )
                      ],
                    ),
                  ],
                ),
                Radio(
                  value: PaymentCard.visaCard,
                  groupValue: _card,
                  onChanged: (PaymentCard? value) {
                    setState(() {
                      _card = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Cart',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 15.0,
                )
              ],
            ),
            Consumer<CartProvider>(
              builder: (context, _provider, child) => _provider.cart.isNotEmpty
                  ? Container(
                      // margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 140.toHeight,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _provider.cart.length,
                          itemBuilder: (context, index) {
                            Product product =
                                Provider.of<ProductProvider>(context)
                                    .getProduct(_provider.cart[index]);
                            return CartTile(
                              product: product,
                              updateSubtotal: updateSubtotal,
                              showCounter: false,
                            );
                          }),
                    )
                  : const Text('Loading list...'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(color: Colors.grey, fontSize: 13.toFont),
                ),
                Text(
                  '\$ 420.69',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.toFont),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: TextButton(
                onPressed: () {},
                child: const Text('Pay Now'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(350)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
