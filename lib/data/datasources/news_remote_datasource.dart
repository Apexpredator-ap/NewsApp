import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../services/api_manager.dart';
import '../models/news_response.dart';
import '../models/source_response.dart';

class NewsRemoteDataSource {
  final ApiManager apiManager;

  NewsRemoteDataSource({required this.apiManager});

  Future<SourceResponse> getSources(String category) async {
    try {
      return await ApiManager.getSources(category);
    } catch (e) {
      throw Exception('Failed to fetch sources: $e');
    }
  }

  Future<NewsResponse> getNewsBySources(String sourceId) async {
    try {
      return await ApiManager.getNews(sourceId);
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }

  Future<NewsResponse> searchNews(String query) async {
    try {
      return await ApiManager.searchNews(query);
    } catch (e) {
      throw Exception('Failed to search news: $e');
    }
  }
}