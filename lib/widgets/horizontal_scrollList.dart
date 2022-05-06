import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/productProvider.dart';

class HorizontalScrollableList extends StatefulWidget {
  const HorizontalScrollableList({Key? key}) : super(key: key);

  @override
  State<HorizontalScrollableList> createState() =>
      _HorizontalScrollableListState();
}

class _HorizontalScrollableListState extends State<HorizontalScrollableList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 2, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Most Popular',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('See all'),
            ],
          ),
        ),
        Consumer<ProductProvider>(
          builder: (context, _provider, child) =>
              _provider.productList.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 200.0,
                      child: ListView.builder(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          itemCount: _provider.productList.length,
                          itemBuilder: (BuildContext, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Container(
                                width: 160.0,
                                child: Card(
                                  child: Image.network(
                                    _provider.productList[index].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            );
                          }),
                    )
                  : const Text('Nothing yet :('),
        ),
      ],
    );
  }
}
