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

  bool _pressAttention = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.horizontal_split,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 0, 0, 20),
            child: Text(
              'Find your Style',
              //textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: _pressAttention ? Colors.white : Colors.black,
                    backgroundColor:
                        _pressAttention ? Colors.black : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () =>
                      setState(() => _pressAttention = !_pressAttention),
                  child: const Text('All'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: _pressAttention ? Colors.white : Colors.black,
                    backgroundColor:
                        _pressAttention ? Colors.black : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () =>
                      setState(() => _pressAttention = !_pressAttention),
                  child: const Text('Winter'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: _pressAttention ? Colors.white : Colors.black,
                    backgroundColor:
                        _pressAttention ? Colors.black : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () =>
                      setState(() => _pressAttention = !_pressAttention),
                  child: const Text('Women'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: _pressAttention ? Colors.white : Colors.black,
                    backgroundColor:
                        _pressAttention ? Colors.black : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () =>
                      setState(() => _pressAttention = !_pressAttention),
                  child: const Text('Eyewear'),
                ),
              ],
            ),
          ),
          Consumer<ProductProvider>(
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
        ],
      ),
    );
  }
}
