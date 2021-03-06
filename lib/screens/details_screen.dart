import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/outlined_tab.dart';
import 'package:shopping_app/components/price_text.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/services/size_config.dart';
import 'package:shopping_app/utils/helpers.dart';
import 'package:shopping_app/utils/text_styles.dart';
import 'package:shopping_app/view_model/cart_provider.dart';
import '../view_model/wish_provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.product,
    required this.listName,
  }) : super(key: key);

  final Product product;
  final String listName;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String selectedTab = 'HD';
  void changeTab(String newValue) {
    setState(() {
      selectedTab = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Consumer<WishProvider>(
            builder: (context, _provider, child) => IconButton(
              icon: Icon(
                _provider.wish.contains(widget.product.id)
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: _provider.wish.contains(widget.product.id)
                    ? Colors.red
                    : null,
                semanticLabel: _provider.wish.contains(widget.product.id)
                    ? 'Added to your wishlist'
                    : 'Removed from your wishlist',
              ),
              onPressed: () {
                _provider.updateWish(widget.product.id);
              },
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Center(
                child: Text(
                  Helper().getName(widget.product.name),
                  style: CustomTextStyles().h1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: PriceText(
                price: widget.product.price,
                fontSize: 20.toFont,
                center: true,
              ),
            ),
            Hero(
              tag: widget.product.id + widget.listName,
              child: Container(
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
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    widget.product.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
              child: Text(
                "Description",
                style: CustomTextStyles().h2,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: Text(
                widget.product.plot,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
              child: Text(
                "Select Quality",
                style: CustomTextStyles().h2,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OutlinedTab(
                    name: 'SD',
                    highlightColor: Colors.orange,
                    selectedTab: selectedTab,
                    changeTab: changeTab,
                  ),
                  OutlinedTab(
                    name: 'HD',
                    highlightColor: Colors.orange,
                    changeTab: changeTab,
                    selectedTab: selectedTab,
                  ),
                  OutlinedTab(
                    name: 'UHD',
                    highlightColor: Colors.orange,
                    changeTab: changeTab,
                    selectedTab: selectedTab,
                  ),
                  OutlinedTab(
                    name: 'BluRay',
                    highlightColor: Colors.orange,
                    changeTab: changeTab,
                    selectedTab: selectedTab,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PriceText(
                    price: widget.product.price,
                    fontSize: 25.toFont,
                    center: true,
                  ),
                  Consumer<CartProvider>(
                    builder: (context, _provider, child) => OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        primary: Colors.white,
                        backgroundColor:
                            _provider.containsProduct(widget.product.id)
                                ? Colors.red
                                : Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        _provider.updateCart(widget.product.id, selectedTab);
                        setState(() {}); //Doubt
                      },
                      child: Text(_provider.containsProduct(widget.product.id)
                          ? "Remove from Cart"
                          : "Add to Cart"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
