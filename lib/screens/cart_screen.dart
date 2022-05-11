import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/product_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
          actions: const [
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<ProductProvider>(
                  builder: (context, _provider, child) => _provider
                          .productList.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          width: 160,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              // width: 160.0,
                              child: Card(
                                child: Image.network(
                                  _provider.productList[0].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ))
                      : const Text('Nothing yet :('),
                ),
                Consumer<ProductProvider>(
                  builder: (context, _provider, child) => _provider
                          .productList.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          width: 190,
                          child: Card(
                            elevation: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _provider.productList[0].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Size: ',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                                Text(
                                  '\$' +
                                      _provider.productList[0].price.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterList(),
                                    Icon(
                                      Icons.close_outlined,
                                      size: 15,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : const Text('Nothing yet'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<ProductProvider>(
                  builder: (context, _provider, child) => _provider
                          .productList.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          width: 160,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              // width: 160.0,
                              child: Card(
                                child: Image.network(
                                  _provider.productList[1].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ))
                      : const Text('Nothing yet :('),
                ),
                Consumer<ProductProvider>(
                  builder: (context, _provider, child) => _provider
                          .productList.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          width: 190,
                          child: Card(
                            elevation: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _provider.productList[1].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Size: ',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                                Text(
                                  '\$' +
                                      _provider.productList[1].price.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CounterList(),
                                    Icon(
                                      Icons.close_outlined,
                                      size: 15,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : const Text('Nothing yet'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promo/Student Code or Vouchers',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
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
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      '\$Price',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      '\$10',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                '------------------------------------------------------',
                style: TextStyle(color: Color.fromARGB(255, 198, 198, 198)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      '\$Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: TextButton(
                onPressed: () {},
                child: const Text('Checkout'),
                // style: TextButton.styleFrom(
                //     primary: Colors.white,
                //     backgroundColor: Colors.black,
                //     fixedSize: Size(350, 20),

                //     ),
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

class CounterList extends StatefulWidget {
  const CounterList({Key? key}) : super(key: key);

  @override
  State<CounterList> createState() => _CounterListState();
}

class _CounterListState extends State<CounterList> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: 15,
          onPressed: () {
            setState(() {
              _itemCount = _itemCount + 1;
            });
          },
          icon: Icon(Icons.add),
          // label: Text(''),
        ),
        Text(_itemCount.toString()),
        IconButton(
          iconSize: 15,
          onPressed: () {
            setState(() {
              _itemCount = _itemCount - 1;
            });
          },
          icon: Icon(Icons.remove),
          // label: Text(''),
        ),
      ],
    );
    ;
  }
}
