import 'package:flutter/material.dart';
import 'package:flutter_news_app/data/remote/api_service.dart';
import 'package:flutter_news_app/data/local/news.dart';
import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<News> _newsList = [];
  bool _isLoading = true;
  final _searchController = TextEditingController();
  List<News> _filteredNewsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      final newsList = await ApiService.fetchNews();
      final box = Hive.box('newsBox');
      await box.put('news', newsList);
      setState(() {
        _newsList = newsList;
        _filteredNewsList = newsList;
        _isLoading = false;
      });
    } catch (e) {
      final box = Hive.box('newsBox');
      final newsList = box.get('news', defaultValue: <News>[]);
      setState(() {
        _newsList = newsList.cast<News>();
        _filteredNewsList = newsList.cast<News>();
        _isLoading = false;
      });
    }
  }

  void _filterNews(String query) {
    final filteredNews = _newsList.where((news) {
      final titleLower = news.title.toLowerCase();
      final descriptionLower = news.description.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower) || descriptionLower.contains(searchLower);
    }).toList();
    setState(() {
      _filteredNewsList = filteredNews;
    });
  }

  String _formatTimeDifference(String publishedAt) {
    final publishDate = DateTime.parse(publishedAt);
    final now = DateTime.now();
    final difference = now.difference(publishDate);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (query) {
                      _filterNews(query);
                    },
                    controller: _searchController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search in feed',
                      hintStyle: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 24,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredNewsList.length,
                    itemBuilder: (context, index) {
                      final news = _filteredNewsList[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            news.title,
                            style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news.description,
                                style: const TextStyle(color: Colors.blue),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _formatTimeDifference(news.publishedAt),
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Text(
                                news.source,
                                style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          trailing: news.imageUrl.isNotEmpty
                              ? Image.network(news.imageUrl, fit: BoxFit.cover, width: 100, height: 100)
                              : Container(width: 100, height: 100, color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
