import 'package:flutter/material.dart';
import 'package:shopping_app/components/price_text.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/screens/details_screen.dart';
import 'package:shopping_app/services/size_config.dart';
import 'package:shopping_app/utils/helpers.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    Key? key,
    required this.product,
    required this.listName,
  }) : super(key: key);

  final Product product;
  final String listName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => DetailsPage(
                        product: product,
                        listName: listName,
                      )),
                ),
              )
            },
            child: Hero(
              tag: product.id + listName,
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
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            Helper().getName(product.name),
            style: TextStyle(
              fontSize: 18.toFont,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        PriceText(
          price: product.price,
          fontSize: 18,
        )
      ],
    );
  }
}
