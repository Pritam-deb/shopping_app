import 'package:flutter/material.dart';

import '../model/product.dart';

enum PaymentCard { applePay, masterCard, visaCard }

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentCard? _card = PaymentCard.applePay;
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
                          style: TextStyle(color: Colors.grey, fontSize: 13),
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
                          style: TextStyle(color: Colors.grey, fontSize: 13),
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
                          style: TextStyle(color: Colors.grey, fontSize: 13),
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
            )
          ],
        ),
      ),
    );
  }
}
