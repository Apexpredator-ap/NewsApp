// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:provider/provider.dart';
// import '../../../widgets/category_grid.dart';
// import '../../../widgets/custom_drawer.dart';
// import '../providers/news_provider.dart';
// import 'category_news_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final AdvancedDrawerController _advancedDrawerController = AdvancedDrawerController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News App'),
//       ),
//       drawer: CustomDrawer(),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search News...',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     if (_searchController.text.isNotEmpty) {
//                       Provider.of<NewsProvider>(context, listen: false)
//                           .searchNews(_searchController.text);
//                     }
//                   },
//                 ),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(child: CategoryGrid()),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';

import '../../../widgets/category_grid.dart';
import '../../../widgets/custom_drawer.dart';
import '../providers/news_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final AdvancedDrawerController _advancedDrawerController =
  AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      // backdropColor: Theme.of(context).primaryColor,
      controller: _advancedDrawerController,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      drawer: CustomDrawer(controller: _advancedDrawerController,), // Use the separated drawer file
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _advancedDrawerController.showDrawer();
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search News...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      if (_searchController.text.isNotEmpty) {
                        Provider.of<NewsProvider>(context, listen: false)
                            .searchNews(_searchController.text);
                      }
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(child: CategoryGrid()),
          ],
        ),
      ),
    );
  }
}
