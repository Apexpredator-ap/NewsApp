import 'package:flutter/material.dart';
import '../../../data/models/news_response.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  const NewsDetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            article.urlToImage != null
                ? CachedNetworkImage(
              imageUrl: article.urlToImage!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error),
            )
                : Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey[300],
              child: Icon(Icons.image_not_supported, size: 50),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article.title ?? 'No Title',
                style: Theme.of(context).textTheme.titleLarge,

                //  style: Theme.of(context).textTheme.headline6,
              ),
            ),

            // Author and Date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.author ?? 'Unknown Author',
                    // style: Theme.of(context).textTheme.subtitle2,
                    style: Theme.of(context).textTheme.titleSmall,

                  ),
                  Text(
                    article.publishedAt != null
                        ? DateTime.parse(article.publishedAt!).toString().split(' ')[0]
                        : 'No Date',
                    // style: Theme.of(context).textTheme.caption,
                    style: Theme.of(context).textTheme.bodySmall,

                  ),
                ],
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article.description ?? 'No Description',
                // style: Theme.of(context).textTheme.bodyText1,
                style: Theme.of(context).textTheme.bodyLarge,

              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article.content ?? 'No Content',
                // style: Theme.of(context).textTheme.bodyText2,
                style: Theme.of(context).textTheme.bodyMedium,

              ),
            ),

            // Read More Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement URL launcher to open full article
                },
                child: Text('Read Full Article'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}