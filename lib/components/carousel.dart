import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_app/components/carousel_card.dart';

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
            child: CarouselCard(
              product: widget.productList[index],
              listName: "Carousel",
            ),
          ),
        );
      },
    );
  }
}
