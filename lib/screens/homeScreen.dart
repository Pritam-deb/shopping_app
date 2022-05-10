import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/Carousel.dart';
import 'package:shopping_app/model/productProvider.dart';
import 'package:shopping_app/services/network_requests.dart';
import 'package:shopping_app/services/size_config.dart';

import '../components/horizontal_scrollList.dart';
import 'cartScreen.dart';

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

  String selectedTab = 'All';
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('');
  void changeTab(String newValue) {
    setState(() {
      selectedTab = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: customIcon,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (customIcon.icon == Icons.search) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = const SizedBox(
                      width: 150,
                      height: 20,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'search movies',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    );
                  } else {
                    customIcon = const Icon(Icons.search);
                    customSearchBar = const Text('');
                  }
                });
              },
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              style: OutlinedButton.styleFrom(side: BorderSide.none),
              label: Text(''),
            )
          ],
          title: const Text(
            'Your Digital Store',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ButtonOutlined(
                  name: 'All',
                  selectedTab: selectedTab,
                  changeTab: changeTab,
                ),
                ButtonOutlined(
                  name: 'Action and Adventure',
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
                ButtonOutlined(
                  name: 'Comedy',
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
                ButtonOutlined(
                  name: 'Drama',
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Consumer<ProductProvider>(
              builder: ((context, _provider, child) {
                return _provider.productList.isNotEmpty
                    ? Carousel(
                        productList: _provider.productList,
                      )
                    : const Text(
                        "Loading Carousel",
                      );
              }),
            ),
          ),
          HorizontalScrollableList(
            screenWidth: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}

class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({
    Key? key,
    required this.name,
    required this.selectedTab,
    required this.changeTab,
  }) : super(key: key);

  final String name;
  final String selectedTab;
  final Function changeTab;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: selectedTab == name ? Colors.white : Colors.black,
          backgroundColor: selectedTab == name ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          changeTab(name);
        },
        child: Text(name),
      ),
    );
  }
}
