// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../presentations/providers/theme_provider.dart';
//
// class CustomDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//
//     return Drawer(
//       child: ListView(
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//             ),
//             child: Text(
//               'News App Menu',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.brightness_6),
//             title: Text('Dark/Light Mode'),
//             trailing: Switch(
//               value: themeProvider.themeMode == ThemeMode.dark,
//               onChanged: (value) {
//                 themeProvider.toggleTheme();
//               },
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.info),
//             title: Text('About Us'),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text('About News App'),
//                   content: Text('A comprehensive news application built with Flutter.'),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text('Close'),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.exit_to_app),
//             title: Text('Exit'),
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';

import '../presentations/providers/theme_provider.dart';

class CustomDrawer extends StatelessWidget {
  final AdvancedDrawerController controller;

  CustomDrawer({required this.controller});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'News App Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Dark/Light Mode'),
            trailing: Switch(
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('About News App'),
                  content: Text(
                      'A comprehensive news application built with Flutter.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
