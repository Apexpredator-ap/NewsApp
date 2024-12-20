import 'package:flutter/material.dart';
import '../../../../services/api_manager.dart';
import '../../../../data/models/news_response.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _news = [];
  List<Article> get news => _news;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchNewsByCategory(String category) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Fetch sources for the category first
      var sourcesResponse = await ApiManager.getSources(category);

      if (sourcesResponse.sources.isNotEmpty) {
        // Get news from the first source
        var newsResponse = await ApiManager.getNews(sourcesResponse.sources[0].id);
        _news = newsResponse.articles;
      }
    } catch (e) {
      print('Error fetching news: $e');
      _news = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchNews(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      var newsResponse = await ApiManager.searchNews(query);
      _news = newsResponse.articles;
    } catch (e) {
      print('Error searching news: $e');
      _news = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}