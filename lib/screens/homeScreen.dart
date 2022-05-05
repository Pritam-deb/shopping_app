import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/productProvider.dart';
import 'package:shopping_app/services/network_requests.dart';
import 'package:shopping_app/services/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    NetworkRequests().fetchProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.horizontal_split),
            Icon(Icons.search),
          ],
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: ((context, _provider, child) {
          return _provider.productList.isNotEmpty
              ? Text(_provider.productList[0].genre,
                  style: TextStyle(
                    fontSize: 20.toFont,
                  ))
              : const Text(
                  "nothing yet :(",
                );
        }),
      ),
    );
  }
}
