import 'dart:convert';
import 'package:flutter_news_app/data/local/news.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _apiKey = '83b8f1451f9b4daa874be44b9ddb324c';
  static const String _baseUrl = 'https://newsapi.org/v2/everything?q=keyword&apiKey=$_apiKey';

  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<News> newsList = (data['articles'] as List).map((json) => News.fromJson(json)).toList();
      print('Fetched ${newsList.length} articles from the API');
      return newsList;
    } else {
      print('Failed to load news: ${response.body}');
      throw Exception('Failed to load news');
    }
  }
}

