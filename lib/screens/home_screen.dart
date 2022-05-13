import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/Carousel.dart';
import 'package:shopping_app/components/outlined_tab.dart';
import 'package:shopping_app/routes/route_names.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/utils/text_styles.dart';
import 'package:shopping_app/view_model/product_provider.dart';
import 'package:shopping_app/services/network_requests.dart';
import 'package:shopping_app/services/size_config.dart';

import '../components/horizontal_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    NetworkRequests().fetchProducts(context, 'All');
  }

  void changeCategory(String selectedTab) {
    NetworkRequests().fetchProducts(context, selectedTab);
  }

  String selectedTab = 'All';
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('');
  void changeTab(String newValue) {
    setState(() {
      selectedTab = newValue;
      changeCategory(selectedTab);
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
                    customSearchBar = SizedBox(
                      width: 150.toWidth,
                      height: 20.toHeight,
                      child: const TextField(
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
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                SetupRoutes.push(
                  context,
                  Routes.CART,
                );
              },
              style: OutlinedButton.styleFrom(side: BorderSide.none),
              label: const Text(''),
            )
          ],
          title: Text(
            'Your Digital Store',
            textAlign: TextAlign.center,
            style: CustomTextStyles().h1,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 60.toHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                OutlinedTab(
                  name: 'All',
                  highlightColor: Colors.black,
                  selectedTab: selectedTab,
                  changeTab: changeTab,
                ),
                OutlinedTab(
                  name: 'Horror',
                  highlightColor: Colors.black,
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
                OutlinedTab(
                  name: 'Comedy',
                  highlightColor: Colors.black,
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
                OutlinedTab(
                  name: 'Drama',
                  highlightColor: Colors.black,
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
                OutlinedTab(
                  name: 'Documentary, Special Interests',
                  highlightColor: Colors.black,
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
                OutlinedTab(
                  name: 'Action and Adventure',
                  highlightColor: Colors.black,
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
