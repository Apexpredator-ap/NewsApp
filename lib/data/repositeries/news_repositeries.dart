import '../datasources/news_remote_datasource.dart';
import '../models/news_response.dart';
import '../models/source_response.dart';

class NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepository({required this.remoteDataSource});

  Future<List<Source>> fetchSourcesByCategory(String category) async {
    try {
      final sourcesResponse = await remoteDataSource.getSources(category);
      return sourcesResponse.sources;
    } catch (e) {
      print('Repository Error - Sources: $e');
      return [];
    }
  }

  Future<List<Article>> fetchNewsBySource(String sourceId) async {
    try {
      final newsResponse = await remoteDataSource.getNewsBySources(sourceId);
      return newsResponse.articles;
    } catch (e) {
      print('Repository Error - News: $e');
      return [];
    }
  }

  Future<List<Article>> searchNews(String query) async {
    try {
      final newsResponse = await remoteDataSource.searchNews(query);
      return newsResponse.articles;
    } catch (e) {
      print('Repository Error - Search: $e');
      return [];
    }
  }
}