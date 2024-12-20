import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 import '../../../widgets/news_item_widget.dart';
import '../providers/news_provider.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String category;

  const CategoryNewsScreen({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryNewsScreenState createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<NewsProvider>(context, listen: false)
          .fetchNewsByCategory(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.category.toUpperCase()} News')),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: newsProvider.news.length,
            itemBuilder: (context, index) {
              return NewsItemWidget(article: newsProvider.news[index]);
            },
          );
        },
      ),
    );
  }
}
