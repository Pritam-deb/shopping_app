import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/utils/text_styles.dart';
import 'package:shopping_app/view_model/cart_provider.dart';

class CounterList extends StatefulWidget {
  const CounterList({
    Key? key,
    required this.updateSubtotal,
    required this.price,
    required this.id,
    required this.count,
  }) : super(key: key);

  final Function updateSubtotal;
  final double price;
  final String id;
  final double count;

  @override
  State<CounterList> createState() => _CounterListState();
}

class _CounterListState extends State<CounterList> {
  late int _itemCount;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      widget.updateSubtotal(widget.price, _itemCount);
    });
    _itemCount = widget.count.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _itemCount = _itemCount > 1 ? _itemCount - 1 : _itemCount;
            });
            _itemCount > 0
                ? widget.updateSubtotal(widget.price, _itemCount)
                : null;
            Provider.of<CartProvider>(context, listen: false).updateCount(
              widget.id,
              _itemCount.toDouble(),
            );
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
            _itemCount = _itemCount + 1;
            widget.updateSubtotal(widget.price, _itemCount);
            Provider.of<CartProvider>(context, listen: false).updateCount(
              widget.id,
              _itemCount.toDouble(),
            );
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
