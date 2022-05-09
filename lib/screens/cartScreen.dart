import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/productProvider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              Text(
                'My Cart',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Container(
              child: Row(
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    height: 200.0,
                    width: 190,
                    color: Colors.yellowAccent,
                    child: Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('product 2'),
                          Text('Size: '),
                          Text('Price: '),
                          Row(
                            children: [
                              // CounterList(),
                              Icon(Icons.cancel),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Container(
              child: Row(
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
                                    _provider.productList[2].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ))
                        : const Text('Nothing yet :('),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    height: 200.0,
                    width: 190,
                    color: Colors.yellowAccent,
                    child: Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('product 2'),
                          Text('Size: '),
                          Text('Price: '),
                          Row(
                            children: [
                              CounterList(),
                              Icon(Icons.cancel),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
    return ListTile(
      // title: Text('idk'),
      trailing: Row(
        children: <Widget>[
          _itemCount != 0
              ? IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => setState(() => _itemCount--),
                )
              : Container(),
          Text(_itemCount.toString()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() => _itemCount++),
          )
        ],
      ),
    );
  }
}
