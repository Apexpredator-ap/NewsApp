import 'package:flutter/material.dart';
import 'package:newsapp/ui/home/search/search_delgate.dart';

import '../../core/utils/image_utils.dart';
import 'categories_tab/categories_tab_widget.dart';
import 'categories_tab/category_details/category_details.dart';
import 'categories_tab/category_item.dart';
import 'home_drawer/home_drawer.dart';
import 'settings_tab/settings_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesTabWidget(
      onCategoryItemClicked: onCategoryItemClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  ImageUtils.getImagePathByName(imageName: 'pattern.png')))),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
                'News App'), // Static title replacing AppLocalizations
            actions: [
              IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: NewsSearchDelegate()),
                icon: const Icon(
                  Icons.search,
                  size: 25,
                ),
              )
            ],
          ),
          drawer: HomeDrawer(onMenuItemClicked: onMenuItemClicked),
          body: selectedWidget),
    );
  }

  late Widget selectedWidget;

  void onMenuItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoriesTabWidget(
            onCategoryItemClicked: onCategoryItemClicked,
          );
        }
        break;
      case MenuItem.settings:
        {
          selectedWidget = SettingsTabWidget();
        }
        break;
    }
    Navigator.pop(context);
    setState(() {});
  }

  onCategoryItemClicked(CategoryItem catItem) {
    selectedWidget = CategoryDetails(
      catItem: catItem,
    );
    setState(() {});
  }
}
