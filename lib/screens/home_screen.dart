import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/Carousel.dart';
import 'package:shopping_app/components/carousel_card.dart';
import 'package:shopping_app/components/outlined_tab.dart';
import 'package:shopping_app/firebase_options.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/routes/route_names.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/utils/text_styles.dart';
import 'package:shopping_app/view_model/product_provider.dart';
import 'package:shopping_app/services/network_requests.dart';
import 'package:shopping_app/services/size_config.dart';
import 'package:firebase_core/firebase_core.dart';

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

    // Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
  }

  void changeCategory(String selectedTab) {
    NetworkRequests().fetchProducts(context, selectedTab);
  }

  String selectedTab = 'All';
  bool searchActive = false;
  double size = 0.0;

  List<Product> searchResult = [];

  Widget customSearchBar = const Text('');
  void changeTab(String newValue) {
    setState(() {
      selectedTab = newValue;
      changeCategory(selectedTab);
    });
  }

  void changeSize() {
    setState(() {
      size = 400;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: !searchActive
                  ? const Icon(Icons.search)
                  : const Icon(Icons.delete),
              color: Colors.black,
              onPressed: () {
                changeSize();
                setState(() {
                  searchActive = !searchActive;
                  if (searchActive == false) {
                    searchResult.clear();
                  }
                });
              },
            ),
            !searchActive
                ? OutlinedButton.icon(
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
                : Container()
          ],
          title: !searchActive
              ? Text(
                  'Your Digital Store',
                  textAlign: TextAlign.center,
                  style: CustomTextStyles().h1,
                )
              : AnimatedSize(
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 3),
                  child: Container(
                    width: size,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "What do want to watch?",
                        fillColor: Colors.white70,
                      ),
                      onChanged: (val) {
                        var res =
                            Provider.of<ProductProvider>(context, listen: false)
                                .search(val);
                        setState(() {
                          searchResult = res;
                        });
                      },
                    ),
                  ),
                ),
        ),
      ),
      body: searchResult.isEmpty
          ? ListView(
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
                      OutlinedTab(
                        name: 'Drama',
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
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
              ),
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselCard(
                      product: searchResult[index], listName: "search"),
                );
              },
            ),
    );
  }
}
