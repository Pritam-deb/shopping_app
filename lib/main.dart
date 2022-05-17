import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/view_model/cart_provider.dart';
import 'package:shopping_app/view_model/product_provider.dart';
import 'package:shopping_app/view_model/wish_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        initialRoute: SetupRoutes.initialRoute,
        routes: SetupRoutes.routes,
      ),
    );
  }
}
