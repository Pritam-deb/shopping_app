import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/carousel_card.dart';
import 'package:shopping_app/utils/strings.dart';
import 'package:shopping_app/view_model/product_provider.dart';

class HorizontalScrollableList extends StatefulWidget {
  const HorizontalScrollableList({Key? key, required this.screenWidth})
      : super(key: key);

  final screenWidth;

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
              Text(
                Strings().hrListOne,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(Strings().seeAll),
            ],
          ),
        ),
        Consumer<ProductProvider>(
          builder: (context, _provider, child) =>
              _provider.productList.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _provider.productList.length,
                          itemBuilder: (BuildContext context, index) {
                            return _provider.productList[index].type == "Movie"
                                ? SizedBox(
                                    width: widget.screenWidth / 2,
                                    child: CarouselCard(
                                      product: _provider.productList[index],
                                      listName: "Movie",
                                    ),
                                  )
                                : Container();
                          }),
                    )
                  : const Text('Loading list...'),
        ),
      ],
    );
  }
}
