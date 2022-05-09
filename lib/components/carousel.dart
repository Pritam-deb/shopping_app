import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/utils/helpers.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final productList;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentPage,
      viewportFraction: 0.6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PageView.builder(
        itemCount: widget.productList.length,
        physics: const ClampingScrollPhysics(),
        controller: _pageController,
        itemBuilder: (context, index) {
          return carouselView(index);
        },
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, index2) {
        double rotateValue = 0.0;
        double scaleValue = 1.0;
        if (_pageController.position.haveDimensions) {
          rotateValue = index.toDouble() - (_pageController.page ?? 0);
          scaleValue = (rotateValue * 0.2).abs();
          rotateValue = rotateValue * 0.07;
          rotateValue = rotateValue.clamp(-1, 1);
        }
        return Transform.rotate(
          angle: rotateValue,
          child: Transform.scale(
            scale: 1 - scaleValue,
            child: CarouselCard(product: widget.productList[index]),
          ),
        );
      },
    );
  }
}

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            Helper().getName(product.name),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '\u{20AC} ${product.price}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
