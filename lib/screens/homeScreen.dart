import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/Carousel.dart';
import 'package:shopping_app/model/productProvider.dart';
import 'package:shopping_app/services/network_requests.dart';
import 'package:shopping_app/services/size_config.dart';

import '../widgets/horizontal_scrollList.dart';
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
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text('');
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
                  customSearchBar,
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
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                    ),
                    style: OutlinedButton.styleFrom(side: BorderSide.none),
                    label: Text(''),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
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
                ButtonOutlined(
                  name: 'All',
                  selectedTab: selectedTab,
                  changeTab: changeTab,
                ),
                ButtonOutlined(
                  name: 'Winter',
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
                ButtonOutlined(
                  name: 'Eyewear',
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
                ButtonOutlined(
                  name: 'Women',
                  changeTab: changeTab,
                  selectedTab: selectedTab,
                ),
              ],
            ),
          ),
          Consumer<ProductProvider>(
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
          HorizontalScrollableList(),
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
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: selectedTab == name ? Colors.white : Colors.black,
        backgroundColor: selectedTab == name ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        changeTab(name);
      },
      child: Text(name),
    );
  }
}
