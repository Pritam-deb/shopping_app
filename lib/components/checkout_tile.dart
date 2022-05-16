import 'package:flutter/material.dart';
import 'package:shopping_app/utils/text_styles.dart';

class CheckoutTile extends StatelessWidget {
  const CheckoutTile({
    Key? key,
    required this.icon,
    required this.primaryText,
    required this.secondaryText,
    required this.iconRight,
  }) : super(key: key);

  final IconData icon;
  final String primaryText;
  final String secondaryText;
  final bool iconRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              child: Icon(icon),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  primaryText,
                  style: CustomTextStyles().h2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  secondaryText,
                  style: CustomTextStyles().greyText14,
                )
              ],
            ),
          ],
        ),
        iconRight == true
            ? const Icon(
                Icons.arrow_forward_ios,
                size: 15.0,
                color: Colors.grey,
              )
            : Container()
      ],
    );
  }
}
