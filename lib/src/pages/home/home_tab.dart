import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/pages/home/components/category_tile.dart';
import 'package:quitanda_virtual/src/pages/home/components/search_field.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              right: 15.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: (30),
            ),
            children: [
              const TextSpan(
                text: 'Quitanda',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'Goiana',
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SearchField(),
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    category: appData.categories[index],
                    isSelected: appData.categories[index] == selectedCategory,
                    onPressed: () {
                      setState(() {
                        selectedCategory = appData.categories[index];
                      });
                    },
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: appData.categories.length),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                16,
              ),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: appData.items.length,
              itemBuilder: (_, index) {
                return Container(
                  color: Colors.red,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
