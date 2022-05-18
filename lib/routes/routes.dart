import 'package:flutter/material.dart';
import 'package:shopping_app/routes/route_names.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/checkout_screen.dart';
import 'package:shopping_app/screens/details_screen.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/screens/sign_screen.dart';
import 'package:shopping_app/screens/signup_screen.dart';

class SetupRoutes {
  static String initialRoute = Routes.LOGIN;
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
      Routes.LOGIN: (context) => const SignScreen(),
      Routes.SIGNUP: (context) => const Signup(),
      Routes.CHECKOUT: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        return CheckoutScreen(
          subTotal: args['subTotal'],
        );
      },
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
