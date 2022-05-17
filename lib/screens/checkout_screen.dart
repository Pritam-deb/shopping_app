import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/checkout_tile.dart';
import 'package:shopping_app/components/price_text.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/utils/helpers.dart';
import 'package:shopping_app/utils/text_styles.dart';
import 'package:shopping_app/view_model/cart_provider.dart';
import 'package:shopping_app/view_model/product_provider.dart';
import '../services/size_config.dart';

enum PaymentCard { applePay, masterCard, visaCard }

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    Key? key,
    required this.subTotal,
  }) : super(key: key);

  final double subTotal;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentCard? _card = PaymentCard.applePay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[200],
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
                style: CustomTextStyles().h18,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CheckoutTile(
                icon: Icons.location_on_outlined,
                primaryText: "Address line 1",
                secondaryText: "Address City",
                iconRight: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Text(
                'Payment Method',
                style: CustomTextStyles().h18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CheckoutTile(
                    icon: Icons.apple,
                    primaryText: "Apple Pay",
                    secondaryText: "**** **** 0357 8420",
                    iconRight: false,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CheckoutTile(
                    icon: Icons.card_membership,
                    primaryText: "Master Card",
                    secondaryText: "**** **** 0357 8420",
                    iconRight: false,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CheckoutTile(
                    icon: Icons.card_giftcard,
                    primaryText: "VISA Card",
                    secondaryText: "**** **** 0357 8420",
                    iconRight: false,
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
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Cart',
                  style: CustomTextStyles().h18,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 15.0,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 100,
              child: Consumer<CartProvider>(
                  builder: (context, _provider, child) => _provider
                          .cart.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: _provider.cart.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Product product =
                                Provider.of<ProductProvider>(context)
                                    .getProduct(_provider.cart[index]);
                            return SizedBox(
                              width: 200,
                              child: Row(
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 100.toHeight,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        product.imageUrl,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 70.toHeight,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            Helper().getName(product.name),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          PriceText(
                                            price: product.price,
                                            fontSize: 12.toFont,
                                            center: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      : Container()),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: CustomTextStyles().h18,
                ),
                PriceText(
                  price: widget.subTotal,
                  fontSize: 20,
                  center: false,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text("Checkout"),
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  primary: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
