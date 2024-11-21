import 'package:flutter/material.dart';

typedef OnMenuItemClicked = void Function(MenuItem item);

class HomeDrawer extends StatelessWidget {
  final OnMenuItemClicked onMenuItemClicked;
  static int categories = 0;
  static int settings = 1;

  HomeDrawer({required this.onMenuItemClicked});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 110,
                color: Theme.of(context).primaryColor,
                child: const Text(
                  'News App', // Static text replacing AppLocalizations
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white),
                )),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        onMenuItemClicked(MenuItem.categories);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 32,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Categories',
                            // Static text replacing AppLocalizations
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        onMenuItemClicked(MenuItem.settings);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.settings,
                            size: 32,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Settings',
                            // Static text replacing AppLocalizations
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

enum MenuItem {
  categories,
  settings,
}

class MenuItemIndex {
  static const int firstIndex = 0;
  static const int secIndex = 0;
}
