import 'package:flutter/material.dart';
import '../../../data/models/news_response.dart';

class NewsItemWidget extends StatelessWidget {
  final Article article;

  const NewsItemWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(article.title ?? 'No Title'),
        subtitle: Text(article.description ?? 'No Description'),
        leading: article.urlToImage != null
            ? Image.network(
          article.urlToImage!,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        )
            : Container(width: 100, height: 100, color: Colors.grey),
      ),
    );
  }
}
