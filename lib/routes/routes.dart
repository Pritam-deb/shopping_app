import 'package:flutter/material.dart';
import 'package:shopping_app/routes/route_names.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/details_screen.dart';
import 'package:shopping_app/screens/home_screen.dart';

class SetupRoutes {
  static String initialRoute = Routes.HOME;
  static String? currentAtSign;
  static Map<String, WidgetBuilder> get routes {
    return {
      Routes.HOME: (context) => const HomeScreen(),
      Routes.DETAILS: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        return DetailsPage(
          product: args['product'],
          listName: args['listName'],
        );
      },
      Routes.CART: (context) => const CartScreen(),
    };
  }

  static Future push(BuildContext context, String value,
      {Object? arguments, Function? callbackAfterNavigation}) {
    return Navigator.of(context)
        .pushNamed(value, arguments: arguments)
        .then((response) {
      if (callbackAfterNavigation != null) {
        callbackAfterNavigation();
      }
    });
  }

  // ignore: always_declare_return_types
  static replace(BuildContext context, String value,
      {dynamic arguments, Function? callbackAfterNavigation}) {
    Navigator.of(context)
        .pushReplacementNamed(value, arguments: arguments)
        .then((response) {
      if (callbackAfterNavigation != null) {
        callbackAfterNavigation();
      }
    });
  }

  // ignore: always_declare_return_types
  static pushAndRemoveAll(BuildContext context, String value,
      {dynamic arguments, Function? callbackAfterNavigation}) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(
      value,
      (_) => false,
      arguments: arguments,
    )
        .then((response) {
      if (callbackAfterNavigation != null) {
        callbackAfterNavigation();
      }
    });
  }
}
