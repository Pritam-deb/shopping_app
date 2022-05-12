import 'package:flutter/material.dart';
import 'package:shopping_app/utils/text_styles.dart';

class CounterList extends StatefulWidget {
  const CounterList({
    Key? key,
    required this.updateSubtotal,
    required this.price,
  }) : super(key: key);

  final Function updateSubtotal;
  final double price;

  @override
  State<CounterList> createState() => _CounterListState();
}

class _CounterListState extends State<CounterList> {
  int _itemCount = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      widget.updateSubtotal(widget.price);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              Future.delayed(Duration.zero, () async {
                widget.updateSubtotal(-widget.price);
              });
              _itemCount = _itemCount > 0 ? _itemCount - 1 : _itemCount;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.remove,
              size: 16,
            ),
          ),
        ),
        Text(
          _itemCount.toString(),
          style: CustomTextStyles().h2,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _itemCount = _itemCount + 1;
              Future.delayed(Duration.zero, () async {
                widget.updateSubtotal(widget.price);
              });
            });
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.add,
              size: 16,
            ),
          ),
        ),
      ],
    );
    ;
  }
}