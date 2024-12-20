import 'package:flutter/material.dart';
 import '../presentations/screens/category_news_screen.dart';

class CategoryGrid extends StatelessWidget {
  final List<String> categories = [
    'business', 'entertainment', 'general',
    'health', 'science', 'sports', 'technology'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CategoryNewsScreen(
                        category: categories[index]
                    )
                )
            );
          },
          child: Container(
            decoration: BoxDecoration(
              // color: Theme.of(context).primaryColor,
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                categories[index].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}