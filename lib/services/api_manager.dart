import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../data/models/news_response.dart';
 import '../data/models/source_response.dart';

class ApiManager {
  static String baseUrl = dotenv.env['BASE_URL'] ?? 'newsapi.org';
  static String apiKey = dotenv.env['API_KEY'] ?? '';

  static Future<SourceResponse> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, 'v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryId
    });

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return SourceResponse.fromJson(json);
      } else {
        throw Exception('Failed to load sources');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
    });

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return NewsResponse.fromJson(json);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<NewsResponse> searchNews(String query) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'q': query,
    });

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return NewsResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to search news');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}