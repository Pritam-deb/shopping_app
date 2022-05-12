import 'package:flutter/material.dart';

class OutlinedTab extends StatelessWidget {
  const OutlinedTab({
    Key? key,
    required this.name,
    required this.selectedTab,
    required this.changeTab,
    required this.highlightColor,
  }) : super(key: key);

  final String name;
  final String selectedTab;
  final Function changeTab;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: selectedTab == name ? Colors.white : Colors.black,
          backgroundColor: selectedTab == name ? highlightColor : Colors.white,
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
